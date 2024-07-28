class UsersController < ApplicationController
  def new
    # @user = User.new
  end

  def create
    @response = UserFacade.new.create_user(user_params)
    binding.pry
    if @response[:success]
      flash[:success] = "Welcome #{response[:user][:username]}! Please Log In"
      redirect_to root_path
    else
      flash[:error] = "Sorry, your credentials are bad"
      redirect_to new_user_path #need render but redirect to works
    end

  end

  private

  def user_params
    params.permit(:username, :password, :email, :password_confirmation)
  end
end