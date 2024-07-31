class UserService
  def create_user(params)
    response = Faraday.post("https://coding-on-the-john-be-e2b03178993f.herokuapp.com/api/v1/users") do |request|
      request.headers["Content-Type"] = "application/json"
      request.body = { user: params }.to_json
    end
    json = JSON.parse(response.body, symbolize_names: true)
    json[:data]
  end

  def oauth
    response = Faraday.get("https://coding-on-the-john-be-e2b03178993f.herokuapp.com/api/v1/auth/github") do |request|
    end
    json = JSON.parse(response.body, symbolize_names: true)
    json[:data]
  end
end