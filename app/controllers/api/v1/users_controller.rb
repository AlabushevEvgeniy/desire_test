module Api
  module V1
    class UsersController < Api::V1::BaseController
      before_action :authenticate_user!, only: [:favorites]
      before_action :set_user, only: [:show]

      def index
        @users = User.all

        render json: @users
      end

      def favorites
        @favorites = Favorite.where(user: params[:user_id])
        @posts = []
        @favorites.each do |fav|
          @posts << fav.post
        end

        render json: @posts
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
