require 'rails_helper'

RSpec.describe 'Create User', type: :feature do
  describe 'User Story 1' do
    describe "Create User"
    before do 
      visit root_path
    end
    it 'Create User' do
      VCR.use_cassette("create_user") do
        username = "acjtesting5"
        email = "test4554@example.com"
        phone_num = "444-555-6666"
        password = "test"
        password_confirmation = "test"
        
        expect(page).to have_link("Sign Up")

        click_on "Sign Up"

        expect(current_path).to eq(new_user_path)
        fill_in :username, with: username
        fill_in :email, with: email
        fill_in :phone_number, with: phone_num
        check :text_preference
        fill_in :password, with: password
        fill_in :password_confirmation, with: password_confirmation
        save_and_open_page
        
        click_on "Create User"
        
        expect(current_path).to eq(root_path)
        expect(page).to have_content("Welcome #{username}! Please Log In")

        # expect(page).not_to have_link("Sign Up")
        # expect(page).to have_link("Log In")
      end
    end 
  end
end