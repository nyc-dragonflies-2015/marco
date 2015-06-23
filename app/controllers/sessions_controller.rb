class SessionsController < ApplicationController
  def index
  end

  def create
    @user = User.find_by(name: params[:name])
    if !!@user # practiacally, people don't do that !! coercion.  i rarely see it.
      session[:user_id] = @user.id
      redirect_to @user
    else
      flash[:notice] = "There was a problem with your UserName or Password"
      redirect_to login_path
    end
  end

  def delete
    session[:user_id] = nil
    redirect_to root_path
  end
end
