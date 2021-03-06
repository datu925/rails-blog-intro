class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
    @comments = @post.comments
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.create(post_params)
    redirect_to action: "show", id: @post.id
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    @post.update_attributes(post_params)
    redirect_to action: "show"
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to action: "index"
  end

  private

  def post_params
    params.require(:post).permit(:title, :content)
  end

end