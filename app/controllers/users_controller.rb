class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    new_user = User.new(user_params)
    if new_user.save
      session[:user_id] = new_user.id
      flash[:success] = "Welcome #{new_user.username}! Please Log In"
      redirect_to root_path
    else
      redirect_to new_user_path
      flash[:error] = "Sorry, your credentials are bad" #Test sad path
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :password, :email)
  end
end