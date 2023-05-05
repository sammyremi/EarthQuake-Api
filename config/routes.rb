Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root "api/v1/quakes#index"


  namespace :api do
    namespace :v1 do
      resources :quakes, only: [:index, :show]
    end
  end
end
