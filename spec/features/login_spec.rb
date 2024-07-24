require 'rails_helper'

RSpec.describe 'User Login', type: :feature do
  describe 'User Story 1' do
    it 'Create User' do
      user = 
      visit root_path

      # I see a button to "Sign Up" or "Log in"
      expect(page).to have_content("Sign Up")
      # When I click "Sign Up" I am taken to [signup page]
      expect(current_path).to eq(login_path)
      expect(page).to have_field(:name)
      expect(page).to have_field(:email)
      expect(page).to have_field(:password)
      expect(page).to have_field(:confirm_password)
      # Where I can enter name, email, password, confirm password

      # And I am taken to the "Log In"
    end 
  end
end