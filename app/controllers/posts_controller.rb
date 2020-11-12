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

  # checkedアクションは、「既読」の操作を行ったときに実行されるアクション
  def checked
    post = Post.find(params[:id])
    if post.checked 
      # 既読を解除するためにfalseへ変更（updateというActiveRecordのメソッドを使用して更新）
      post.update(checked: false)
    else
      # 既読にするためtrueへ変更
      post.update(checked: true)
    end

    # 更新したレコードをitem = Post.find(params[:id])で取得し直し、
    # render json:{ post: item }でJSON形式（データ）としてchecked.jsに返却
    item = Post.find(params[:id])
    render json: { post: item }
  end

end
