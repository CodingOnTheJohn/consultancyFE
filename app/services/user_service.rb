class UserService
  def create_user(params)
    response = conn.post("/api/v1/users") do |request|
      request.body = params.to_json
    end
    parse_data(response)
  end
  
  def get_user
    response = conn.get("/api/v1/users/1") 
    parse_data(response)
  end
  private
  
  def conn
    Faraday.new(url: "http://localhost:5000")
    #https://coding-on-the-john-be-e2b03178993f.herokuapp.com
    #http://localhost:5000
  end

  def parse_data(response)
    JSON.parse(response.body, symbolize_names: true)
  end
end