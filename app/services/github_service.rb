class GithubService
  def self.fetch_github_token(code)
      response = Faraday.post('https://github.com/login/oauth/access_token', {
      client_id: Rails.application.credentials.github[:client_id],
      client_secret: Rails.application.credentials.github[:client_secret],
      code: code
    }, {
      'Accept' => 'application/json'
    })

    JSON.parse(response.body, symbolize_names: true)[:access_token]
  end

  def self.fetch_github_user(access_token)
      response = Faraday.get('https://api.github.com/user', {}, {
      'Authorization' => "token #{access_token}",
      'User-Agent' => 'CodeSnacks'
    })

    JSON.parse(response.body, symbolize_names: true)
  end

  def self.create_or_signin_github_user(github_user, access_token)
    response = Faraday.post('https://coding-on-the-john-be-e2b03178993f.herokuapp.com/api/v1/github_users', {
      user: {
        username: github_user[:login],
        email: "#{github_user[:login]}@github.com",
        password: access_token,
        uid: github_user[:id]
      }
    })

    JSON.parse(response.body, symbolize_names: true)
  end
# --------------------- Old Logic incase something bad happens ---------------------

  # def self.github_auth
    #   response = Faraday.post('https://github.com/login/oauth/access_token', {
    #     client_id: Rails.application.credentials.github[:client_id],
    #     client_secret: Rails.application.credentials.github[:client_secret],
    #     code: params[:code]
    #   }, {
    #     'Accept' => 'application/json'
    #   })

    # access_token = JSON.parse(response.body, symbolize_names: true)[:access_token]

    # response = Faraday.get('https://api.github.com/user', {}, {
    # 'Authorization' => "token #{access_token}",
    # 'User-Agent' => 'CodeSnacks'
    # })
    # user = JSON.parse(response.body, symbolize_names: true)

  #   response = Faraday.post('https://coding-on-the-john-be-e2b03178993f.herokuapp.com/api/v1/github_users', {
  #     user: {
  #       username: user[:login],
  #       email: "#{user[:login]}@github.com",
  #       password: access_token,
  #       uid: user[:id]
  #     }
  #   })

  #   user = JSON.parse(response.body, symbolize_names: true)
  # end
end