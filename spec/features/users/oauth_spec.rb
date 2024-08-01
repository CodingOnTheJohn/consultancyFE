require "rails_helper"

describe "OAuth GitHub" do
  it "allows a user to login with Github" do
    VCR.use_cassette("github_oauth") do
      visit "/auth/github/callback?code=mock_code"

      expect(current_path).to eq(root_path)
      expect(page).to have_content("Welcome gbowman!")
    end
  end
  it "Sad Path bad credentials", :vcr => false do
    VCR.turn_off!
    stub_request(:post, "https://github.com/login/oauth/access_token")
      .with(
        body: {
          "client_id" => Rails.application.credentials.github[:client_id],
          "client_secret" => Rails.application.credentials.github[:client_secret],
          "code" => "bad_code"
        },
        headers: {
          'Accept' => 'application/json'
        }
      )
      .to_return(
        status: 400,
        body: '{"error": "validation_failed", "error_description": "Validation failed: Email can\'t be blank"}',
        headers: { 'Content-Type' => 'application/json' }
      )

    stub_request(:get, "https://api.github.com/user").with(
          headers: {
        'Accept'=>'*/*',
        'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
        'Authorization'=>'token',
        'User-Agent'=>'CodeSnacks'
          }).to_return(status: 401, body: '{"message": "Bad credentials"}', headers: { 'Content-Type' => 'application/json' })
    
    stub_request(:post, "https://coding-on-the-john-be-e2b03178993f.herokuapp.com/api/v1/github_users").with(
        body: {"user"=>{"email"=>"@github.com", "password"=>nil, "uid"=>nil, "username"=>nil}},
        headers: {
        'Accept'=>'*/*',
        'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
        'Content-Type'=>'application/x-www-form-urlencoded',
        'User-Agent'=>'Faraday v2.10.0'
        }).
      to_return(status: 401, body: '{"message": "Bad credentials"}', headers: { 'Content-Type' => 'application/json' })

    visit "/auth/github/callback?code=bad_code"

    expect(current_path).to eq("/users/new")
    expect(page).to have_content("Sorry, your credentials are bad")

    VCR.turn_on!
  end
end