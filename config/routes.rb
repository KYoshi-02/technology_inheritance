Rails.application.routes.draw do  
 
  resources :knowhow_posts
  devise_for :users
  root "home#index"
  resources :users, only: [:index]
  resources :memos, only: [:create, :destroy]
  resources :quizzes, only: [:index, :new, :create, :show, :edit, :update, :destroy] do
   resources :answers, only: [:create]
  end
end
