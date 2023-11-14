class PostsController < ApplicationController
  def index
    @posts = Post.all
    @posts ||= [] # データがnilの場合は空の配列を設定
  end

  def new
    @post = Post.new
    
  end

  def create
    @post = Post.new(params.require(:post).permit(:title, :memo, :start_at, :end_at, :is_all_day ))
    if @post.save
      flash[:sccess] = "投稿を作成しました"
      redirect_to :posts
    else
      flash.now[:failire] ="投稿を作成できませんでした"
      render "new"
    end
  end


  def show
    @post = Post.find(params[:id])
  end

  def edit
    @post = Post.find(params[:id]) 
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(params.require(:post).permit(:title, :memo, :start_at, :end_at, :is_all_day ))
      flash[:sccess] = "投稿を更新しました"
      redirect_to :posts
    else
      flash.now[:failire] ="投稿を更新できませんでした"
      render "edit"
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    flash[:sccess] = "投稿を削除しました"
    redirect_to posts_path
  end
end
