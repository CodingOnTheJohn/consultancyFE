require 'rails_helper'

RSpec.describe 'Create User', type: :feature do
  describe "Happy Paths" do 
    it 'Create User' do
      VCR.use_cassette("create_user") do
        username = "acjtesting5"
        email = "test4554@example.com"
        phone_num = "444-555-6666"
        password = "test"
        password_confirmation = "test"
        
        visit root_path

        expect(page).to have_link("Sign Up")

        within(".navbar") do
          click_on "Sign Up"
        end

        expect(current_path).to eq(new_user_path)
        fill_in :username, with: username
        fill_in :email, with: email
        fill_in :phone_number, with: phone_num
        check :text_preference
        fill_in :password, with: password
        fill_in :password_confirmation, with: password_confirmation
        
        click_on "Create User"
        
        expect(current_path).to eq(root_path)
        expect(page).to have_content("Welcome #{username}")

        expect(page).not_to have_link("Sign Up")
        expect(page).not_to have_link("Log In")
      end
    end
  end

  describe "Sad Paths" do 
    it "cannot create new user if username already exists" do
      VCR.use_cassette("sad_create_user_already_exists") do
        username = "acjtesting5"
        email = "test4554@example.com"
        phone_num = "444-555-6666"
        password = "test"
        password_confirmation = "test"
        
        visit new_user_path

        fill_in :username, with: username
        fill_in :email, with: email
        fill_in :phone_number, with: phone_num
        fill_in :password, with: password
        fill_in :password_confirmation, with: password_confirmation
        
        click_on "Create User"        
      end
    end
  end
end