class PostsController < ApplicationController


  def index
    @posts = Post.all
  end



  def show
    @post = Post.find params[:id]
    # puts params
    # render json: params
  end

  def new
    @post = Post.new
  end

  def create
    # render json: params
    Post.create post_params
    redirect_to posts_path
  end

  def edit
    @post = Post.find params[:id]
  end

  def update
    # render json: params
    t = Post.find params[:id]
    t.update post_params
    redirect_to posts_path
  end

  def destroy
    # render json: params
    Post.find(params[:id]).delete
    redirect_to posts_path
  end

   private

  def post_params
    params.require(:post).permit(:title,:link)
  end




end
