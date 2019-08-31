module Api
  module V1
    class UserPostsController < Api::V1::BaseController
      before_action :set_user, only: [:index]

      def index
        @users_posts = Post.where(user_id: @user.id)

        render json: @users_posts
      end

      private

      def set_user
        @user = User.find(params[:id])
      end
    end
  end
end
