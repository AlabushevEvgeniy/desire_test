Rails.application.routes.draw do
  devise_for :users, path: 'api/v1/users'

  namespace :api do
    namespace :v1 do

      resources :posts
      resources :user_posts, only: [:index]
      resources :users, only: [:index]
    end
  end
end
