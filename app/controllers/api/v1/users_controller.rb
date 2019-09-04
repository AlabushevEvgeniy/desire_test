module Api
  module V1
    class UsersController < Api::V1::BaseController
      before_action :authenticate_user!, only: [:favorites, :unread]

      def index
        @users = User.all

        render json: @users
      end

      def favorites
        favorite_posts = Favorite.where(user: params[:user_id]).map(&:post)

        render json: favorite_posts
      end

      def unread
        user = User.find(params[:user_id])
        unread_posts = Post.unread_for_user(user)

        render json: unread_posts
      end

      def posts
        @users_posts = Post.where(user: params[:user_id])

        render json: @users_posts
      end
    end
  end
end
