class User
  attr_reader :id, :username

  def initialize(data)
    @id = data[:id]
    @username = data[:attributes][:username]
  end
end
