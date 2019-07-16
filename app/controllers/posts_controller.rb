class PostsController < ApplicationController
  before_action :post_params, only: [:create]
  before_action :set_my_thread, only: [:show,:update,:edit,:destroy]

  def new
    @post = Post.new
  end

  #新しく投稿されたテキストを受け取るアクション
  def create
    @post = Post.new(post_params)
    if @post.save
      flash[:notice] = "投稿を作成しました"
      redirect_to("/home/index")
    else
      render("posts/new")
    end
  end

    #投稿内容を更新する
    def update
      @post = Post.find(params[:id])
       if @post.update(post_params)
         flash[:notice] = "投稿を編集しました"
         redirect_to("/home/index")
       else
         render 'edit'
       end
    end

    def show
      @post = Post.find(params[:id])
      @comments = @post.comments
      @comment = Comment.new
    end

    def destroy
      @post = Post.find(params[:id])
      @post.destroy
      flash[:notice] = "投稿を削除しました"
      redirect_to("/home/index")
    end

  private

  def post_params
    params.require(:post).permit(:title, :body)
  end

  def set_my_thread
    @post = Post.find(params[:id])
  end

end
