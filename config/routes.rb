Rails.application.routes.draw do  
 
  resources :knowhow_posts
  devise_for :users
  root "home#index"
  resources :users, only: [:index]
  resources :memos, only: [:create, :destroy]
  resources :quizzes
  resources :answers, only: [:create]
end
