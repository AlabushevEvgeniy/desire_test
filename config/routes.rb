Rails.application.routes.draw do
  devise_for :users

  resources :posts
  resources :user_posts, only: [:index]
  resources :users, only: [:index]
end
