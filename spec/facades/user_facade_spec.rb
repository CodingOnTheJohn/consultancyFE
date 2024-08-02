require "rails_helper"

RSpec.describe UserFacade do
  describe "#create_user" do
    it "should return hash of user information on successful creation" do 
      VCR.use_cassette("create_user") do
        facade = UserFacade.new
        response = facade.create_user({"username"=>"acjtesting5", "password"=>"test", "email"=>"test4554@example.com", "password_confirmation"=>"test"})

        expect(response).to be_a Hash
        expect(response[:attributes][:email]).to eq("test4554@example.com")
      end
    end

    it "should return error hash if unsuccessful" do 
      VCR.use_cassette("create_user_sad") do
        facade = UserFacade.new
        response = facade.create_user({"username"=>"a", "password"=>"test", "email"=>"test4554@example.com", "password_confirmation"=>"t"})
     
        expect(response).to be_a Hash
        expect(response[:errors]).to be_a Hash
      end
    end
  end
end