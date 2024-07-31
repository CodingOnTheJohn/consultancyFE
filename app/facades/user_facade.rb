class UserFacade
  def create_user(params)
    UserService.new.create_user(params)
  end

  def oauth
    binding.pry
    UserService.new.oauth
  end
end