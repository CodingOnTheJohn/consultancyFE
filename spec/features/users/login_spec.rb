require 'rails_helper'

RSpec.describe 'User Login', type: :feature do
  describe 'User can Log in' do
    describe 'as a user when I visit login_path' do
      before(:each) do
        VCR.use_cassette("create_user") do
          #refactor this with stub `allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(:user)`     
          username = "acjtesting56" 
          email = "test4556@example.com"
          password = "test"
          password_confirmation = "test"

          visit root_path
          click_on "Sign Up"
          expect(current_path).to eq(new_user_path)

          fill_in :username, with: username
          fill_in :email, with: email
          fill_in :password, with: password
          fill_in :password_confirmation, with: password_confirmation
          click_on "Create User"
          cassette_file_path = 'spec/fixtures/vcr_cassettes/create_user.yml'
          cassette_data = YAML.load_file(cassette_file_path)
          
          fixture_response = cassette_data.dig("http_interactions", 0, "response", "body", "string")
          @user = JSON.parse(fixture_response)["data"]
          # @user = {"id"=>"12", "type"=>"user", "attributes"=>{"email"=>"test4554@example.com", "username"=>"acjtesting5"}}
        end
        require 'pry' ; binding.pry
        visit user_login_path(@user["id"])
      end

      it 'Can log in a user' do
        fill_in :username, with: @user["attributes"]["username"]
        fill_in :email, with: @user["attributes"]["email"] #don't we need to also pass a password to verify with bcrypt in our user api db?
        click_on "Log In"
        expect(current_path).to eq(user_dashboard)
        expect(page).to have_content('You have successfully logged in') #or "Logged In as #{user.username}"
      end
    end 
  end
end