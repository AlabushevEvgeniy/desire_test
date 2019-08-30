class PostsController < ApplicationController
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
    @post = Post.create(post_params)

    render_resource(@post)
  end

  def update
    render_resource(@post) if @post.update(post_params)
  end

  def destroy
    @post.destroy
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
      :published
    )
  end
end
