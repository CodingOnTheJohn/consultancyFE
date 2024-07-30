require 'rails_helper'

RSpec.describe 'Create User', type: :feature do
  describe 'User Story 1' do
    describe "Create User"
    it 'Create User' do
      VCR.use_cassette("create_user") do
        username = "acjtesting5"
        email = "test4554@example.com"
        password = "test"
        password_confirmation = "test"
        
        visit root_path

        expect(page).to have_link("Sign Up")

        click_on "Sign Up"

        expect(current_path).to eq(new_user_path)
        
        fill_in :username, with: username
        fill_in :email, with: email
        fill_in :password, with: password
        fill_in :password_confirmation, with: password_confirmation
        
        click_on "Create User"

        expect(current_path).to eq(user_login_path)
        save_and_open_page
        expect(page).to have_content("Welcome #{username}! Please Log In")

        # expect(page).not_to have_link("Sign Up")
        # expect(page).to have_link("Log In")
      end
    end 
  end
end