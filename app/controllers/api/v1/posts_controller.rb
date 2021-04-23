class Api::V1::PostsController < ApplicationController
  protect_from_forgery :except => [:create]

  def create
    @post = Post.new(post_params)
    @post.save
    redirect_to  root_path
  end

  def top
    @posts = Post.all
    render json:@posts
  end

  private
    def post_params
      params.permit(:title, :post_introduction, :user_id)
    end
end