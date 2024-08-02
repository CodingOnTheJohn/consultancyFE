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
        visit new_user_path
        fill_in :username, with: username
        fill_in :email, with: email
        fill_in :phone_number, with: phone_num
        check :text_preference
        fill_in :password, with: password
        fill_in :password_confirmation, with: password_confirmation
        
        click_on "Create User"
        
        expect(current_path).to eq(root_path)
        expect(page).to have_content("Welcome #{username}")

        expect(page).not_to have_link('Sign Up')
        expect(page).not_to have_link("Log In")
      end
    end 

    describe "Sad Paths" do
      describe "username" do 
        it "username already exists" do 
          visit new_user_path
          # let!(:usberer) { { "id"=>"12", "type"=>"user", "attributes"=>{ "email"=>"test4554@example.com", "username"=>"acjtesting5" } } }
          @username = "acjtesting5"
          @email = "test4554@example.com"
          @phone_num = "444-555-6666"
          @password = "test"
          @password_confirmation = "test"
          

          fill_in :username, with: @username
          fill_in :email, with: @email
          fill_in :phone_number, with: @phone_num
          check :text_preference
          fill_in :password, with: @password
          fill_in :password_confirmation, with: @password_confirmation
          
          click_on "Create User"
          
          expect(current_path).to eq(new_user_path)
          expect(page).to have_content("Name can't be blank")
        end
      end

      describe "email" do
        it "User create page: invalid email" do
          visit new_user_path

          @username = "acjtesting5"
          @email = "test4554@example.com"
          @phone_num = "444-555-6666"
          @password = "test"
          @password_confirmation = "test"

          fill_in :username, with: @username
          fill_in :email, with: "bademail"
          fill_in :phone_number, with: @phone_num
          check :text_preference
          fill_in :password, with: @password
          fill_in :password_confirmation, with: @password_confirmation
          
          click_on "Create User"
          
          expect(current_path).to eq(new_user_path)
          expect(page).to have_content("Email is invalid")
        end
      end
        
      describe "passwords" do
        it "User create page: passwords don't match" do
          visit new_user_path

          @username = "acjtesting5"
          @email = "test4554@example.com"
          @phone_num = "444-555-6666"
          @password = "test"
          @password_confirmation = "test"

          fill_in :username, with: @username
          fill_in :email, with: @email
          fill_in :phone_number, with: @phone_num
          check :text_preference
          fill_in :password, with: @password
          fill_in :password_confirmation, with:"sets"
          
          click_on "Create User"
          
          expect(current_path).to eq(new_user_path)
          expect(page).to have_content("Passwords don't match")
        end
      end
    end
  end
end
