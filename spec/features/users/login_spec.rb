require 'rails_helper'

RSpec.describe 'User Login', type: :feature do
  describe 'Happy Path' do
    it 'Can log in a user' do
      VCR.use_cassette("login_user") do
        visit root_path

        within(".navbar") do
          click_on "Log In"
        end

        expect(current_path).to eq(login_form_path)

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

  describe "Sad Path" do 
    it "cannot login if username already exists" do
      VCR.use_cassette("sad_login") do
        visit login_form_path

        fill_in :email, with: "test4554@example.com"
        fill_in :password, with: "notcorrectpassword"
        
        within(".d-grid") do
          click_on "Log In"
        end
        
        expect(current_path).to eq(login_form_path)
        expect(page).to have_content("Sorry, your credentials are bad")
      end
    end
  end
end