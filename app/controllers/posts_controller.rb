class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]

  def index
    @posts = Post.all
    @today_date = Date.today
    @post_count = @posts.count
    @no_schedules_message = "現在登録しているスケジュールはありません" if @post_count.zero?
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      flash[:success] = "投稿を作成しました"
      redirect_to post_path(@post)
    else
      flash.now[:failure] = "投稿を作成できませんでした"
      render "new"
    end
  end

  def show
  end

  def edit
  end

  def update
    if @post.update(post_params)
      flash[:success] = "投稿を更新しました"
      redirect_to post_path(@post)
    else
      flash.now[:failure] = "投稿を更新できませんでした"
      render "edit"
    end
  end

  def destroy
    @post.destroy
    flash[:notice] = "投稿を削除しました"
    redirect_to posts_path
  end

  private

  def post_params
    params.require(:post).permit(:title, :memo, :start_at, :end_at, :is_all_day)
  end

  def set_post
    @post = Post.find(params[:id])
  end
end
