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

  def github_callback
    # response = Faraday.post('https://github.com/login/oauth/access_token', {
    #   client_id: Rails.application.credentials.github[:client_id],
    #   client_secret: Rails.application.credentials.github[:client_secret],
    #   code: params[:code]
    # }, {
    #   'Accept' => 'application/json'
    # })

    # access_token = JSON.parse(response.body, symbolize_names: true)[:access_token]

    # response = Faraday.get('https://api.github.com/user', {}, {
    # 'Authorization' => "token #{access_token}",
    # 'User-Agent' => 'CodeSnacks'
    # })
    # user = JSON.parse(response.body, symbolize_names: true)

    # response = Faraday.post('https://coding-on-the-john-be-e2b03178993f.herokuapp.com/api/v1/github_users', {
    #   user: {
    #     username: user[:login],
    #     email: "#{user[:login]}@github.com",
    #     password: access_token,
    #     uid: user[:id]
    #   }
    # })

    # user = JSON.parse(response.body, symbolize_names: true)
    user = UserFacade.new.github_oauth

    session[:user_id] = user[:data][:id]
    flash[:success] = "Welcome #{user[:data][:attributes][:username]}!"
    redirect_to root_path
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