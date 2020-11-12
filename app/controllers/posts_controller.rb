class PostsController < ApplicationController
  def index
    # 順番を降順
    @posts = Post.all.order(id: "DESC")
  end

  def create
    Post.create(content: params[:content])
    # 保存後はトップページへリダイレクト
    redirect_to action: :index
  end
end
