class UserService
  def create_user(params)
    response = Faraday.post("http://localhost:5000/api/v1/users") do |request|
      request.body = {
        user: params
          }.to_json
          binding.pry
    end
    binding.pry
    JSON.parse(response.body, symbolize_names: true)
  end
end

#   def get_user
#     response = conn.get("/api/v1/users/1") 
#     parse_data(response)
#   end

#   def conn
#     Faraday.new(url: "http://localhost:5000")
#     #https://coding-on-the-john-be-e2b03178993f.herokuapp.com
#     #http://localhost:5000
#   end

#   def parse_data(response)
#     JSON.parse(response.body, symbolize_names: true)
#   end
# end