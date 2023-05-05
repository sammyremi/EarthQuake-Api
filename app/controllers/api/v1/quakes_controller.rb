class Api::V1::QuakesController < ApplicationController

    def index
        @quakes = Quake.paginate(page: params[:page], per_page: 20)
        render json: @quakes
    end


    def show
        @quake = Quake.find(params[:id])
        render json: @quake
    end

    def create
        @quake = Quake.new(quake_params)
        if @quake.save
          render json: @quake, status: :created
        else
          render json: @quake.errors, status: :unprocessable_entity
        end
    end


    def update
        @quake = Quake.find(params[:id])
        if @quake.update(quake_params)
          render json: @quake, status: :ok
        else
          render json: @quake.errors, status: :unprocessable_entity
        end
    end

    def destroy
        @quake = Quake.find(params[:id])
        @quake.destroy
        head :no_content
    end

    private

    def quake_params
        params.require(:quake).permit(:datetime, :latitude, :longitude, :depth, :magnitude, :mag_type, :nb_stations, :gap, :distance, :rms, :source, :event_id)
    end
end
