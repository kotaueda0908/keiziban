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
      flash[:notice] = "投稿を作成しました"
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

    #投稿内容を更新する
    def update
      @post = Post.find(params[:id])
       if @post.update(post_params)
         flash[:notice] = "投稿を編集しました"
         redirect_to("/posts/index")
       else
         render 'edit'
       end
    end

    #投稿を削除する
    def destroy
      @post = Post.find(params[:id])
      @post.destroy
      flash[:notice] = "投稿を削除しました"
      redirect_to("/posts/index")
    end

  private

  def post_params
    params.require(:post).permit(:title, :body)
  end

end
