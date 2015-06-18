class SessionsController < ApplicationController
  def index
  end

  def create
    @user = User.find_by(name: params[:name])
    if !!@user
      session[:user_id] = @user.id
      redirect_to @user
    else
      flash[:notice] = "There was a problem with your UserName or Password"
      redirect_to login_path
    end
  end
end
