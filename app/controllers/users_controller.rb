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

  def dashboard
  end

  def github_callback
    response = Faraday.post('https://github.com/login/oauth/access_token', {
      client_id: Rails.application.credentials.github[:client_id],
      client_secret: Rails.application.credentials.github[:client_secret],
      code: params[:code]
    }, {
      'Accept' => 'application/json'
    })

    access_token = JSON.parse(response.body, symbolize_names: true)[:access_token]

    response = Faraday.get('https://api.github.com/user', {}, {
    'Authorization' => "token #{access_token}",
    'User-Agent' => 'CodeSnacks'
    })
    user = JSON.parse(response.body, symbolize_names: true)

    response = Faraday.post('https://coding-on-the-john-be-e2b03178993f.herokuapp.com/api/v1/users/github_users', {
      user: {
        username: user[:login],
        email: user[:email],
        password: user[:id],
        uid: user[:uid]
      }
    })
    # binding.pry
    user = JSON.parse(response.body, symbolize_names: true)

    session[:user_id] = user[:data][:id]
    flash[:success] = "Welcome #{response[:attributes][:username]}! Please Log In"
    redirect_to root_path
  end

  private

  def user_params
    params.permit(:username, :password, :phone_num, :email, :password_confirmation)
  end
end