class UserFacade
  def create_user(params)
    UserService.new.create_user(params)
  end
end