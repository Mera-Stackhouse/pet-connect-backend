Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :events, only: [:show, :create, :update]
      resources :pets, only: [:create, :update, :index, :destroy]
      resources :users, only: [:show, :create, :update, :index]
      # get '/profile/:id', to: 'users#profile'



    end
  end
  post '/login', to: 'application#login'
end
