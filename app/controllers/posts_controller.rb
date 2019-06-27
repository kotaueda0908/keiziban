class PostsController < ApplicationController
  before_action :post_params, only: [:create]
  #投稿されたテキストを表示するページ
  def index
    @posts = Post.all
  end
  #新しく投稿を作成できるページ
  def new
     @post = Post.new
  end

  #新しく投稿されたテキストを受け取るアクション
  def create
    @post = Post.new(post_params)
    @post.save
    redirect_to("/posts/index")
  end

  # なぜprivateにする必要があるか？
  private

  def post_params
    params.require(:post).permit(:title, :body)
  end

end
