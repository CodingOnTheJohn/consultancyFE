require 'rails_helper'

RSpec.describe 'Create User', type: :feature do
  describe 'User Story 1' do
    describe "Happy Paths" do 
      it 'Create User' do
        visit root_path
        username = "Jane Doe"
        email = "test@test.com"
        password = "test"


        # I see a button to "Sign Up" or "Log in"
        expect(page).to have_link("Sign Up")
        # When I click "Sign Up" I am taken to [signup page]
        click_on "Sign Up"
        # And I am taken to new_user_path
        expect(current_path).to eq(new_user_path)

        # Where I expect to see a form to fill in name, email, password, confirm password
        expect(page).to have_field(:user_username)
        expect(page).to have_field(:user_email)
        expect(page).to have_field(:user_password)
        # expect(page).to have_field(:user_confirm_password)
        # expect(page).to have_field(:confirm_password)
        
        # I fill in name, email, password, confirm password
        fill_in :user_username, with: username
        fill_in :user_email, with: email
        fill_in :user_password, with: password
        # fill_in :user_confirm_password, with: password
        
        # and click on "Submit"
        click_on "Create User"
        # And I am taken back to the root_path where I see a welcome message
        expect(current_path).to eq(root_path)
        expect(page).to have_content("Welcome #{username}! Please Log In")

        # I no longer see the "Sign Up" button but only "Log In"
        expect(page).not_to have_link("Sign Up")
        expect(page).to have_link("Log In")
      end 
    end

    describe "Sad Paths" do 
      before do 
        visit root_path
        @username = "Jane Doe"
        @email = "test@test.cm"
        @password = "test"
        @incorrect_password = "tset"

        expect(page).to have_link("Sign Up")
        click_on "Sign Up"
        expect(current_path).to eq(new_user_path)
      end

      it 'flashes error when name is empty' do
        fill_in :user_username, with: ""
        fill_in :user_email, with: @email
        fill_in :user_password, with: @password

        
        click_on "Create User"
        expect(current_path).to eq(new_user_path)
        expect(page).to have_content("Sorry, your credentials are bad")
      end 

      it 'flashes error when email is empty' do
        fill_in :user_username, with: @username
        fill_in :user_email, with: ""
        fill_in :user_password, with: @password

        
        click_on "Create User"
        expect(current_path).to eq(new_user_path)
        expect(page).to have_content("Sorry, your credentials are bad")
      end 

      it 'flashes error when password is empty' do
        fill_in :user_username, with: @username
        fill_in :user_email, with: @email
        fill_in :user_password, with: ""

        
        click_on "Create User"
        expect(current_path).to eq(new_user_path)
        expect(page).to have_content("Sorry, your credentials are bad")
      end 
    end
  end
end