class UserFacade
  def create_user(params)
    UserService.new.create_user(params)
  end

  def get_user(id)
    user_detail = UserService.new.get_user(id)
    User.new(user_detail)
  end

  def login(params)
    UserService.new.login(params)
  end

  def oauth
    UserService.new.oauth
  end
end
