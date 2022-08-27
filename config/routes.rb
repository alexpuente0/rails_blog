Rails.application.routes.draw do
  devise_for :users

    devise_scope  :user do
    get 'users/sign_out' => 'devise/sessions#destroy'

  end
  
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  
  resources :users do
    member do
      get 'api_token'
    end
  end

namespace :api do
  resources :users do
      resources :posts do
        resources :comments
        resources :likes
    end
  end
end

  # Defines the root path route ("/")
  # root "articles#index"

  root "users#index"
    resources :users, only: [:index, :show] do
      resources :posts, only: [:index, :show] do
        resources :comments, only: [:new, :create, :destroy]
        resources :likes, only: [:create]
  end
end
resources :posts, only: [:new, :create, :destroy]
end