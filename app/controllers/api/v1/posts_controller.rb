module Api
  module V1
    class PostsController < Api::V1::BaseController
      before_action :authenticate_user!, except: [:index, :show]
      before_action :set_post, only: [:show, :update, :destroy]

      def index
        @posts = Post.all

        render json: @posts
      end

      def show
        render_resource(@post)
      end

      def create
        post = Post.new(post_params)
        post.user = current_user
        post.save!

        render_resource(@post)
      end

      def update
        @post.update(post_params)

        render_resource(@post)
      end

      def destroy
        @post.destroy if current_user_can_edit?(@post)
      end

      private

      def set_post
        @post = Post.find(params[:id])
      end

      def post_params
        params.fetch(:post, {}).permit(
          :title,
          :preview,
          :text,
          :published,
          :user_id
        )
      end
    end
  end
end
