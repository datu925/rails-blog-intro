class CommentsController < ApplicationController
  def new
    @post = Post.find_by(id: params[:post_id])
    @comment = @post.comments.new
  end

  def create
    @post = Post.find_by(id: params[:post_id])
    @comment = @post.comments.create(comment_params)
    puts @comment.inspect
    redirect_to action: "show", controller: "posts", id: params[:post_id]
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_to action: "show", controller: "posts", id: params[:post_id]
  end

  private

  def comment_params
    params.require(:comment).permit(:author_id, :content, :post_id)
  end
end