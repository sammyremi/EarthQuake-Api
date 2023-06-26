class Api::V1::QuakesController < ApplicationController
  before_action :authenticate_user, only: [:create, :show, :update, :destroy]

  def index
    # Use Redis to cache the results of the query for 5 minutes
    @quakes = Rails.cache.fetch('quakes', expires_in: 5.seconds) do
      Quake.paginate(page: params[:page], per_page: 20)
    end
    render json: @quakes
  end

  def show
    # Use Redis to cache the result of the query for 1 minute
    @quake = Rails.cache.fetch("quake_#{params[:id]}", expires_in: 1.minute) do
      Quake.find(params[:id])
    end
    render json: @quake

  end

  def create
    @quake = Quake.new(quake_params)
    if @quake.save
      # Clear the cache when a new quake is created
      Rails.cache.delete('quakes')
      render json: @quake, status: :created
    else
      render json: @quake.errors, status: :unprocessable_entity
    end
  end

  def update
    @quake = Quake.find(params[:id])
    if @quake.update(quake_params)
      # Clear the cache when a quake is updated
      Rails.cache.delete("quake_#{params[:id]}")
      Rails.cache.delete('quakes')
      render json: @quake, status: :ok
    else
      render json: @quake.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @quake = Quake.find(params[:id])
    @quake.destroy
    # Clear the cache when a quake is destroyed
    Rails.cache.delete("quake_#{params[:id]}")
    Rails.cache.delete('quakes')
    head :no_content
  end

  private

  def quake_params
    params.require(:quake).permit(:datetime, :latitude, :longitude, :depth, :magnitude, :mag_type, :nb_stations, :gap, :distance, :rms, :source, :event_id)
  end

  def authenticate_user
    unless current_user
      render json: { error: "You must be logged in to perform this action" }, status: 401
    end
  end

end
