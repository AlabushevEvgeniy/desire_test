module Api
  module V1
    class UsersController < Api::V1::BaseController
      before_action :authenticate_user!, only: [:favorites, :unread]
      before_action :set_user, only: [:show]

      def index
        @users = User.all

        render json: @users
      end

      def favorites
        # favorites = Favorite.where(user: params[:user_id])
        # posts = []
        # favorites.each do |fav|
        #   posts << fav.post
        # end
        favorite_posts = Post.includes(:favorites).where('favorites.user_id': current_user.id)

        render json: favorite_posts
      end

      def unread
        read_posts = Post.includes(:read_posts).where('read_posts.user_id': current_user.id)
        alien_posts = Post.all - Post.where(user_id: current_user.id)
        unread = alien_posts - read_posts

        render json: unread
      end

      private

      def set_user
        @user = User.find(params[:id])
      end

      def user_params
        params.fetch(:user, {}).permit(
          :name,
          :email,
          :signature,
          :encrypted_password
        )
      end
    end
  end
end
