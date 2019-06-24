class PostsController < ApplicationController
  #formを表示するaction
  def new
    @post = Post.new
  end
  #newからのdataを受け取って保存をする処理をする
  def create
  end
end
