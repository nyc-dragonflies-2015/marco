class UsersController < ApplicationController
  before_action :require_logged_in, only: [:show]
  def show
    @user = User.find_by(id: session[:user_id])
    @posts = @user.posts
    @comments = @user.comments
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      flash[:notice] = "There was a problem with your UserName or Password"
    end
  end

  def edit
    @user = User.find_by(id: session[:user_id])
  end

  def update
    # byebug
    @user = User.find_by(id: session[:user_id])
    if @user.authenticate(params[:user][:password])
      @user.update(user_params)
      redirect_to user_path
    else
      flash[:notice] = "Your password was incorrect"
      redirect_to edit_user_path
    end
  end

  def destroy
    @user = User.find_by(id: session[:user_id])
    @user.destroy
    redirect_to root_path
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password)
  end
end
