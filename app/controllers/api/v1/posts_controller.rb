class Api::V1::PostsController < ApplicationController
  skip_before_action :verify_authenticity_token

  def create
    @post = Post.new(post_params)
    if @post.save
      render json: @post, status: :created
    else
      render json: @post.errors, status: :unprocessable_entity
    end
  end

  def top
    @posts = Post.all
    render json: @posts
  end

  def destroy
    Post.find(params[:id]).destroy!
  end

  private
    def post_params
      params.require(:post).permit(:title, :post_introduction, :user_id)
    end
end