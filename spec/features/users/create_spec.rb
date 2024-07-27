require 'rails_helper'

RSpec.describe 'Create User', type: :feature do
  describe 'User Story 1' do
    describe "Happy Paths" do 
      it 'Create User' do
        visit root_path
        username = "Jane Doe"
        email = "test@test.com"
        password = "test"

        expect(page).to have_link("Sign Up")
        click_on "Sign Up"
        expect(current_path).to eq(new_user_path)

        expect(page).to have_field(:username)
        expect(page).to have_field(:email)
        expect(page).to have_field(:password)
        expect(page).to have_field(:password_confirmation)
        
        fill_in :username, with: username
        fill_in :email, with: email
        fill_in :password, with: password
        fill_in :password_confirmation, with: password
        
        click_on "Create User"
        expect(current_path).to eq(root_path)
        expect(page).to have_content("Welcome #{username}! Please Log In")

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
        fill_in :username, with: ""
        fill_in :email, with: @email
        fill_in :password, with: @password
        fill_in :password_confirmation, with: @password

        click_on "Create User"
        expect(current_path).to eq(new_user_path)
        expect(page).to have_content("Sorry, your credentials are bad")
      end 

      it 'flashes error when email is empty' do
        fill_in :username, with: @username
        fill_in :email, with: ""
        fill_in :password, with: @password
        fill_in :password_confirmation, with: @password

        click_on "Create User"
        expect(current_path).to eq(new_user_path)
        expect(page).to have_content("Sorry, your credentials are bad")
      end 

      it 'flashes error when password is empty' do
        fill_in :username, with: @username
        fill_in :email, with: @email
        fill_in :password, with: ""
        fill_in :password_confirmation, with: @password

        click_on "Create User"
        expect(current_path).to eq(new_user_path)
        expect(page).to have_content("Sorry, your credentials are bad")
      end 
    end
  end
end