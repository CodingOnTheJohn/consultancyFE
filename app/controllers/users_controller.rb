class UsersController < ApplicationController
  def new
  end

  def create
    response = UserFacade.new.create_user(user_params)
    if response[:id]
      flash[:success] = "Welcome #{response[:attributes][:username]}! Please Log In"
      redirect_to root_path
      #redirect_to user_login_path(response[:id].to_i)
    else
      flash[:error] = "Sorry, your credentials are bad"
      redirect_to new_user_path
    end
  end

  def login
    # user.id = params["user_id"]
  end

  private

  def user_params
    params.permit(:username, :password, :email, :password_confirmation)
  end
end