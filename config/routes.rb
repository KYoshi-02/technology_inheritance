Rails.application.routes.draw do
  get 'knowhows/index'
  get 'knowhows/new'
  get 'knowhows/create'
  get 'knowhows/show'
  devise_for :users
  root "home#index"
  resources :users, only: [:index]
end
