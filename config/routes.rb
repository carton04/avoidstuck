Rails.application.routes.draw do
  devise_for :users
  root to: 'congestions#index'
  resources :congestions do
    resources :comments, only: [:create]
  end
  resources :users, only: [:show]
end
