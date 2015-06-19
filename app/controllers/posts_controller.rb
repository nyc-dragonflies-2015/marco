class PostsController < ApplicationController
  def show
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      PostVote.create(user_id: session[:user_id], post_id: @post.id)
      redirect_to @post
    else
      flash[:notice] = "There was a problem submitting your post"
    end
  end

  private
  def post_params
    params.require(:post).permit(:body, :url)
  end
end
