class UsersController < ApplicationController
  def new
  end

  def create
    response = UserFacade.new.create_user(user_params)
    # response =  {:id=>"12", :type=>"user", :attributes=>{:email=>"test4554@example.com", :username=>"acjtesting5"}}
    if response[:id]
      session[:user_id] = response[:id]
      flash[:success] = "Welcome #{response[:attributes][:username]}! Please Log In"
      redirect_to root_path
      #redirect_to user_login_path(response[:id].to_i)
    else
      flash[:error] = "Sorry, your credentials are bad"
      redirect_to new_user_path
    end
  end

  def login
    @user_id = params["user_id"]
    # session[:user_id] = response[:id].to_i

    #flash messages
    # redirect_to user_path(@user_id) # or whatever page we show snacks on
  end

  def oauth
    binding.pry
    response = UserFacade.new.oauth
    if response[:id]
      session[:user_id] = response[:id]
      flash[:success] = "Welcome #{response[:attributes][:username]}! Please Log In"
      redirect_to root_path
    else
      flash[:error] = "Sorry, your credentials are bad"
      redirect_to new_user_path
    end
  end

  def dashboard
  end

  private

  def user_params
    params.permit(:username, :password, :phone_num, :email, :password_confirmation)
  end
end