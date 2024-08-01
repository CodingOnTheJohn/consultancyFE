class UserFacade
  def create_user(params)
    UserService.new.create_user(params)
  end

  def get_user(id)
    response = UserService.new.get_user(id)
    json = JSON.parse(response.body, symbolize_names: true)
    user_detail = json[:data]
    User.new(user_detail)
  end

  def login(params)
    UserService.new.login(params)
  end
end

