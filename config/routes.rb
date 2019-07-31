Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :events, only: [:show, :create, :update, :destroy]
      resources :pets, only: [:create, :update, :index, :destroy]
      resources :users, only: [:show, :create, :update, :index]
      resources :user_relationships, only: [ :create, :update, :destroy]
      # get '/profile/:id', to: 'users#profile'

      get '/users/friends/:id', to: 'users#friends'
      # delete '/relationships/', to: 'user_relationships#destroy'

    end
  end
  post '/login', to: 'application#login'
  # get 'users/friends/:id', to: 'users#friends'
end
