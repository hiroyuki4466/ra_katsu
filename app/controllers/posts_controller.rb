class PostsController < ApplicationController
  def index
    @posts = Post.where(user_id: current_user.id).order(updated_at: 'DESC')
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(params.require(:post).permit(:ramen_image, :shop_name, :address, :shop_memo, :shop_score))
    @post.user = current_user
    if @post.save
      redirect_to :posts
    else
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
    if @post.update(params.require(:post).permit(:ramen_image, :shop_name, :address, :shop_memo, :visited_date, :shop_score))
      flash[:notice] = "店舗情報を更新しました"
      redirect_to :posts
    else
      render "show"
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to :root_path
  end
end
