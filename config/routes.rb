Rails.application.routes.draw do
  devise_for :users

  resources :posts
  resources :user_posts, only: [:index]
  resources :users, only: [:index, :create] do
    get 'posts', to: 'users#posts'
  end
end
