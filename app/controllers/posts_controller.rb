class PostsController < ApplicationController
  def index
    @all_data = Post.all
  end

  def new
    @data_1 = Post.find(1)
  end

  def create
    Post.create(content: params[:content])
  end
end
