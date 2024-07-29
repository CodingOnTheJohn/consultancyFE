class UserService
  def create_user(params)
    response = Faraday.post("http://localhost:5000/api/v1/users") do |request|
      request.headers["Content-Type"] = "application/json"
      request.body = { user: params }.to_json
    end
    json = JSON.parse(response.body, symbolize_names: true)
    json[:data]
  end
end