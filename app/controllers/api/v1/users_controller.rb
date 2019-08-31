module Api
  module V1
    class UsersController < Api::V1::BaseController
      before_action :set_user, only: [:posts, :show]

      def index
        @users = User.all

        render json: @users
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
