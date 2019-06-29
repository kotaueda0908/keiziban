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
    if @post.save
      redirect_to("/posts/index")
    else
      render("posts/new")
    end
  end

    #投稿詳細ページを表示する
    def show
      @post = Post.find(params[:id])
    end

    #投稿内容を編集する
    def edit
      @post = Post.find(params[:id])
    end

    def update
      @post = Post.find(params[:id])
      @post.title = params[:title]
      @post.body = params[:body]
      if @post.save
        redirect_to("/posts/index")
      else
        render("posts/edit")
      end
    end

  # なぜprivateにする必要があるか？
  private

  def post_params
    params.require(:post).permit(:title, :body)
  end

end
