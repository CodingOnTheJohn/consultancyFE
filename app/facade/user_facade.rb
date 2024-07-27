class UserFacade
  def create_user(params)
  #   # params = { username: , email: , password: }
    UserService.new.create_user(params) # need endpoint for users
  end


  #directs to UserService
    #a path/endpoint to create user
  # get User
  # login if user has account
end