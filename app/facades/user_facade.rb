class UserFacade
  def create_user(params)
    binding.pry
    UserService.new.create_user(params)
  end
end