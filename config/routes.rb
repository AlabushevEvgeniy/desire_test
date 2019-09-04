Rails.application.routes.draw do
  devise_for :users, path: 'api/v1/users'

  namespace :api do
    namespace :v1 do
      resources :posts do
        post 'add_to_favorites', to: 'posts#add_to_favorites'
      end
      resources :users, only: [:index] do
        get 'favorites', to: 'users#favorites'
        get 'unread', to: 'users#unread'
        get 'posts', to: 'users#posts'
      end
    end
  end
end
