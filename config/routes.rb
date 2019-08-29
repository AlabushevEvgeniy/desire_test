Rails.application.routes.draw do
  devise_for :users
  resources :posts
  resources :users do
    get 'posts', to: 'users#posts'
  end
end
