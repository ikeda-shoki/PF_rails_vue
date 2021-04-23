class Api::V1::PostsController < ApplicationController
  def create
    post = Post.new(post_params)
  end
end