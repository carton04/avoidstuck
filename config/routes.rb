Rails.application.routes.draw do
  devise_for :users
  root to: 'congestions#index'
  resources :congestions
end
