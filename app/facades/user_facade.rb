class UserFacade
  def create_user(params)
    UserService.new.create_user(params)
  end
  
  def login(params)
    UserService.new.login(params)
  end
end