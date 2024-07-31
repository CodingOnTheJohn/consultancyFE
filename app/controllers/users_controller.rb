class UsersController < ApplicationController
  def new
  end

  def create
    response = UserFacade.new.create_user(user_params)
    if response[:id]
      session[:user_id] = response[:id]
      flash[:success] = "Welcome #{response[:attributes][:username]}"
      redirect_to root_path
    else
      flash[:error] = "Sorry, your credentials are bad"
      redirect_to new_user_path
    end
  end

  def login_form
  end

  def login
    response = UserFacade.new.login(user_params)
    if response[:id]
      session[:user_id] = response[:id]
      flash[:success] = "Welcome #{response[:attributes][:username]}"
      redirect_to root_path
    else
      flash[:error] = "Sorry, your credentials are bad"
      redirect_to new_user_path
    end
  end

  def oauth
    response = UserFacade.new.oauth
    if response[:id]
      session[:user_id] = response[:id]
      flash[:success] = "Welcome #{response[:attributes][:username]}"
      redirect_to root_path
    else
      flash[:error] = "Sorry, your credentials are bad"
      redirect_to new_user_path
    end
  end

  def dashboard
  end

  def logout
    session.delete :user_id
    redirect_to root_path
    flash[:success] = "Logged out successfully"
  end

  private

  def user_params
    params.permit(:username, :password, :phone_num, :email, :password_confirmation)
  end
end