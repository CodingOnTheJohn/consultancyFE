require 'rails_helper'

RSpec.describe 'Create User', type: :feature do
  describe 'User Story 1' do
    describe "Create User"
    it 'Create User' do
      username = "Jane Doe"
      email = "test@test.com"
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

      expect(current_path).to eq(root_path)
      expect(page).to have_content("Welcome #{username}! Please Log In")

      expect(page).not_to have_link("Sign Up")
      expect(page).to have_link("Log In")
    end 
  end
end