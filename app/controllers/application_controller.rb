class ApplicationController < ActionController::Base
  helper_method :current_user

  def current_user
    @_current_user = session[:user_id]
  end

  # def get_user_from_api(user_id)
  #   response = Faraday.get("http://localhost:5000/api/v1/users/#{user_id}")
  #   require 'pry' ; binding.pry
  #   user = JSON.parse(response.body, symbolize_names: true)
  #   require 'pry' ; binding.pry
  # end
end
