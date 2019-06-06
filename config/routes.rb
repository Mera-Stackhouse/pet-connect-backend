Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :events, only: [:create, :update]
      resources :pets, only: [:create, :update]
      resources :users, only: [:create, :show, :update]
    end
  end
end
