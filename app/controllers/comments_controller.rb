class CommentsController < ApplicationController
  def index
    @post = Post.find_by(id: params[:post_id])
    @comments = @post.comments
  end

  def edit
    @comment = Comment.find_by(id: params[:id])
  end

  def update
    @comment = Comment.find_by(id: params[:id])
    if !!@comment
      @comment.update(body: params[:body])
      redirect_to post_comments_path
    else
      redirect_to :back
    end
  end

  def new
    @post = Post.find_by(id: params[:post_id])
    @comment = Comment.new
  end

  def create
    @comment = Comment.new(post_id: params[:post_id], user_id: session[:user_id], body: comment_params[:body])
    if @comment.save
      redirect_to post_comments_path
    else
      flash[:notice] = "There was something wrong with your submission"
      redirect new_post_comment_path
    end
  end

  def destroy
    @comment = Comment.find_by(id: params[:id])
    @comment.destroy
    redirect_to post_comments_path
  end

  private

  def comment_params
    params.require(:comment).permit(:body)
  end
end
