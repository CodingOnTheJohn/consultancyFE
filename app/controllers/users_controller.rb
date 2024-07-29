class UsersController < ApplicationController
  def new
  end

  def create
    response = UserFacade.new.create_user(user_params)
    if response[:id]
      flash[:success] = "Welcome #{response[:attributes][:username]}! Please Log In"
      redirect_to root_path
    else
      flash[:error] = "Sorry, your credentials are bad"
      redirect_to new_user_path
    end

  end

  private

  def user_params
    params.permit(:username, :password, :email, :password_confirmation)
  end
end