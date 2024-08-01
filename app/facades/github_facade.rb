class GithubFacade
  def self.github_user(code)
    access_token = GithubService.fetch_github_token(code)
    github_user = GithubService.fetch_github_user(access_token)
    GithubService.create_or_signin_github_user(github_user)
  end
end