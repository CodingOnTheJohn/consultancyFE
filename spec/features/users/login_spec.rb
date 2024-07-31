require 'rails_helper'

RSpec.describe 'User Login', type: :feature do
  describe 'User can Log in' do
    let!(:user) { { "id"=>"12", "type"=>"user", "attributes"=>{ "email"=>"test4554@example.com", "username"=>"acjtesting5" } } }

    it 'Can log in a user' do
      visit login_path(user["id"])
      fill_in :username, with: user["attributes"]["username"]
      fill_in :email, with: user["attributes"]["email"] #don't we need to also pass a password to verify with bcrypt in our user api db?
      click_on "Log In"
      expect(current_path).to eq(root_path)
    end
  end
end