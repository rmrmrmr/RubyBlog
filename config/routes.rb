Rails.application.routes.draw do
  devise_for :users
  root 'users#index'

  namespace :api, defaults: { format: 'json' } do
    namespace :v1 do
      post 'login', to: 'login#auth'
      resources :users, only: [:index, :show] do
        resources :posts, only: [:index] do
          resources :comments, only: [:index, :create]
        end
      end
    end
  end

  resources :users, only: [:index, :show] do
    resources :posts, only: [:index, :new, :create, :show, :destroy] do
      resources :comments, only: [:new, :create, :destroy]
      resources :likes, only: [:create]
    end
  end
end
