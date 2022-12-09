Rails.application.routes.draw do
  devise_for :users
  root to: 'congestions#index'
  resources :congestions do
    resources :comments, only: [:create :destroy]
    resources :solutions, only: [:create :destroy]
  end
  resources :users, only: [:show]
end
