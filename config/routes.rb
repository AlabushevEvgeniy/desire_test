Rails.application.routes.draw do
  resources :posts
  resources :users do
    get 'posts', to: 'users#posts'
  end
end
