Rails.application.routes.draw do
  devise_for :users

  resources :posts
  resources :users, only: [:index, :create, :posts] do
    get 'posts', to: 'users#posts'
  end
end
