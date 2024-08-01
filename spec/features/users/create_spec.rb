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

        click_on "Sign Up"

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


    # use Webmock for sad paths ?
    # describe "Sad Paths" do
    #   describe "username" do 
    #     before do 
    #       visit root_path
    #       expect(current_path).to eq(root_path)
    #       click_on "Sign Up"
    #       expect(current_path).to eq(new_user_path)
    #       @username = "acjtesting5"
    #       @email = "test4554@example.com"
    #       @phone_num = "444-555-6666"
    #       @password = "test"
    #       @password_confirmation = "test"
    #     end

    #     it "User create page: missing params - username" do
    #       fill_in :username, with: " "
    #       fill_in :email, with: @email
    #       fill_in :phone_number, with: @phone_num
    #       check :text_preference
    #       fill_in :password, with: @password
    #       fill_in :password_confirmation, with: @password_confirmation
          
    #       click_on "Create User"
          
    #       expect(current_path).to eq(new_user_path)
    #       expect(page).to have_content("Username can't be blank")
    #     end

    #     it "User create page: at least three characters" do
    #       fill_in :username, with: "yz"
    #       fill_in :email, with: @email
    #       fill_in :phone_number, with: @phone_num
    #       check :text_preference
    #       fill_in :password, with: @password
    #       fill_in :password_confirmation, with: @password_confirmation
          
    #       click_on "Create User"
          
    #       expect(current_path).to eq(new_user_path)
    #       expect(page).to have_content("Username is too short (minimum is 3 characters)")
    #     end

    #     # it "username already exists" do 
    #     #   let!(:user) { { "id"=>"12", "type"=>"user", "attributes"=>{ "email"=>"test4554@example.com", "username"=>"acjtesting5" } } }

    #     #   fill_in :username, with: @username
    #     #   fill_in :email, with: @email
    #     #   fill_in :phone_number, with: @phone_num
    #     #   check :text_preference
    #     #   fill_in :password, with: @password
    #     #   fill_in :password_confirmation, with: @password_confirmation
          
    #     #   click_on "Create User"
          
    #     #   expect(current_path).to eq(new_user_path)
    #     #   expect(page).to have_content("Name can't be blank")
    #     # end
    #   end

    #   describe "email" do
    #     before do 
    #       visit root_path
    #       expect(current_path).to eq(root_path)
    #       click_on "Sign Up"
    #       expect(current_path).to eq(new_user_path)
    #       @username = "acjtesting5"
    #       @email = "test4554@example.com"
    #       @phone_num = "444-555-6666"
    #       @password = "test"
    #       @password_confirmation = "test"
    #     end

    #     it "User create page: invalid email" do
    #       fill_in :username, with: @username
    #       fill_in :email, with: "bademail"
    #       fill_in :phone_number, with: @phone_num
    #       check :text_preference
    #       fill_in :password, with: @password
    #       fill_in :password_confirmation, with: @password_confirmation
          
    #       click_on "Create User"
          
    #       expect(current_path).to eq(new_user_path)
    #       expect(page).to have_content("Email is invalid")
    #     end

    #     it "User create page: missing params - email" do
    #       fill_in :username, with: @username
    #       fill_in :email, with: " "
    #       fill_in :phone_number, with: @phone_num
    #       check :text_preference
    #       fill_in :password, with: @password
    #       fill_in :password_confirmation, with: @password_confirmation
          
    #       click_on "Create User"
          
    #       expect(current_path).to eq(new_user_path)
    #       expect(page).to have_content("Email can't be blank")
    #     end
    #   end

    #   describe "phone number" do
    #     before do 
    #       visit root_path
    #       expect(current_path).to eq(root_path)
    #       click_on "Sign Up"
    #       expect(current_path).to eq(new_user_path)
    #       @username = "acjtesting5"
    #       @email = "test4554@example.com"
    #       @phone_num = "444-555-6666"
    #       @password = "test"
    #       @password_confirmation = "test"
    #     end

    #     it "User create page: missing params - phone_number" do
    #       fill_in :username, with: @username
    #       fill_in :email, with: @email
    #       fill_in :phone_number, with: " "
    #       check :text_preference
    #       fill_in :password, with: @password
    #       fill_in :password_confirmation, with: @password_confirmation
          
    #       click_on "Create User"
          
    #       expect(current_path).to eq(new_user_path)
    #       expect(page).to have_content("Phone number can't be blank")
    #     end

    #     it "User create page: phone_number invalid" do
    #       fill_in :username, with: @username
    #       fill_in :email, with: @email
    #       fill_in :phone_number, with: "invalid-phone-number "
    #       check :text_preference
    #       fill_in :password, with: @password
    #       fill_in :password_confirmation, with: @password_confirmation
          
    #       click_on "Create User"
          
    #       expect(current_path).to eq(new_user_path)
    #       expect(page).to have_content("Phone number is invalid")
    #     end
    #   end
      
    #   describe "password" do
    #     before do 
    #       visit root_path
    #       expect(current_path).to eq(root_path)
    #       click_on "Sign Up"
    #       expect(current_path).to eq(new_user_path)
    #       @username = "acjtesting5"
    #       @email = "test4554@example.com"
    #       @phone_num = "444-555-6666"
    #       @password = "test"
    #       @password_confirmation = "test"
    #     end
        
    #     it "User create page: missing params - password" do
    #       fill_in :username, with: @username
    #       fill_in :email, with: @email
    #       fill_in :phone_number, with: @phone_num
    #       check :text_preference
    #       fill_in :password, with: " "
    #       fill_in :password_confirmation, with: @password_confirmation
          
    #       click_on "Create User"
          
    #       expect(current_path).to eq(new_user_path)
    #       expect(page).to have_content("Password can't be blank")
    #     end
        
    #     it "User create page: passwords don't match" do
    #       fill_in :username, with: @username
    #       fill_in :email, with: @email
    #       fill_in :phone_number, with: @phone_num
    #       check :text_preference
    #       fill_in :password, with: @password
    #       fill_in :password_confirmation, with:"sets"
          
    #       click_on "Create User"
          
    #       expect(current_path).to eq(new_user_path)
    #       expect(page).to have_content("Passwords don't match")
    #     end
    #   end
    # end
  end
end