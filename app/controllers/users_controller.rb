class UsersController < ApplicationController
  def new
  end

  def show
    @user = UserFacade.new.get_user(params[:id])
  end

  def create
    response = UserFacade.new.create_user(user_params)
    if response[:id]
      session[:user_id] = response[:id]
      flash[:success] = "Welcome #{response[:attributes][:username]}"
      redirect_to root_path
    else
      flash[:error] = "Sorry, your credentials are bad: #{response[:errors]}"
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

  def github_callback
    user = GithubFacade.github_user(params[:code])
    if user[:data] && user[:data][:id]
      session[:user_id] = user[:data][:id]
      flash[:success] = "Welcome #{user[:data][:attributes][:username]}!"
      redirect_to root_path
    else
      flash[:error] = "Sorry, your credentials are bad"
      redirect_to new_user_path
    end
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
