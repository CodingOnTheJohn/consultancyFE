require 'rails_helper'

RSpec.describe 'User Login', type: :feature do
  describe 'Happy Paths' do
    let!(:user) { { "id"=>"12", "type"=>"user", "attributes"=>{ "email"=>"test4554@example.com", "username"=>"acjtesting5", "password" => "test" } } }

    it 'Can log in a user' do
      VCR.use_cassette("login_user") do
        visit login_path(user["id"])
        fill_in :username, with: user["attributes"]["username"]
        fill_in :email, with: user["attributes"]["email"] #don't we need to also pass a password to verify with bcrypt in our user api db?
        fill_in :username, with: user["attributes"]["password"]

        click_on "Log In"
        expect(current_path).to eq(root_path)
      end
    end
  end

  describe 'Sad Paths' do
    let!(:user) { { "id"=>"12", "type"=>"user", "attributes"=>{ "email"=>"test4554@example.com", "username"=>"acjtesting5", "password" => "test" } } }

    it 'Can log in a user' do
      VCR.use_cassette("login_unsucccessful") do
        visit login_path(user["id"])
        fill_in :username, with: user["attributes"]["username"]
        fill_in :email, with: user["attributes"]["email"] #don't we need to also pass a password to verify with bcrypt in our user api db?
        fill_in :username, with: "tset"

        click_on "Log In"
        expect(current_path).to eq(login_path(user["id"]))
        expect(page).to have_content("Sorry, your credentials are bad")
      end
    end
  end
end