class WelcomeController < ApplicationController
  def index
    @user = UserFacade.new.get_user(session[:user_id]) if session[:user_id]
  end
end
