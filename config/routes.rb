Rails.application.routes.draw do
  devise_for :users, path: 'api/v1/users'

  namespace :api do
    namespace :v1 do
      resources :posts do
        post 'add_to_favorites', to: 'posts#add_to_favorites'
      end
      resources :user_posts, only: [:index]
      resources :users, only: [:index] do
        get 'favorites', to: 'users#favorites'
      end
    end
  end
end
