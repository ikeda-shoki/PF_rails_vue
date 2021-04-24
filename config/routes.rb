Rails.application.routes.draw do
  devise_for :users

  root to: "home#index"

  resources :posts, only: [:create]
  resources :users, only: [:index, :show]

  namespace :api, { format: 'json' } do
    namespace :v1 do
      resources :users, only: [:index, :show]
      resources :posts, only: [:create]
      get "/posts/top" => "posts#top"
      resources :tasks, only: [:index, :create, :destroy, :update]
    end
  end
end
