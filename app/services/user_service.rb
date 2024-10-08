class UserService
  def conn
    Faraday.new("https://coding-on-the-john-be-e2b03178993f.herokuapp.com")
  end

  def create_user(params)
    response = conn.post("/api/v1/users") do |request|
      request.headers["Content-Type"] = "application/json"
      request.body = { user: params }.to_json
    end
    json = JSON.parse(response.body, symbolize_names: true)
    if response.success?
      json[:data]
    else
      { errors: json[:error_object] }
    end
  end

  def get_user(id)
    conn.get("/api/v1/users/#{id}")
  end

  def login(params)
    response = conn.get("/api/v1/login") do |request|
      request.headers["Content-Type"] = "application/json"
      request.body = { user: params }.to_json
    end
    json = JSON.parse(response.body, symbolize_names: true)
    if response.success?
      json[:data]
    else
      { errors: json[:error_object] }
    end
  end
end
