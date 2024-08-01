require 'rails_helper'

RSpec.describe 'User Login', type: :feature do
  describe 'User can Log in from home page' do
    it 'Can log in a user' do
      VCR.use_cassette("login_user") do
        visit root_path

        within(".navbar") do
          click_on "Log In"
        end

        expect(current_path).to eq(login_form_path)

        # expect(page).to have_link("Login with Github")

        fill_in :username, with: "acjtesting5"
        fill_in :email, with: "test4554@example.com"
        fill_in :password, with: "test"
        
        within(".d-grid") do
          click_on "Log In"
        end

        expect(current_path).to eq(root_path)
        expect(page).to have_content("Welcome")
        expect(page).not_to have_link("Sign Up")
        expect(page).not_to have_link("Log In")
      end
    end
  end
end