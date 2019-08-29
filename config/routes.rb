Rails.application.routes.draw do
  devise_for :users, controllers: { sessions: 'users/sessions', registrations: 'users/registrations' }

  resources :posts
  resources :users, only: [:index, :create, :posts] do
    get 'posts', to: 'users#posts'
  end
end
