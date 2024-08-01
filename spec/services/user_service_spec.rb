require "rails_helper"

RSpec.describe UserService do
  describe "#create_user" do
    it "should return a response body parsed from JSON when given a state parameter" do
      parsed_json = UserService.new.create_user({"username"=>"acjtesting5", "password"=>"test", "email"=>"test4554@example.com", "password_confirmation"=>"test"})

      expect(parsed_json).to be_a Hash
      expect(parsed_json[:data]).to be_a Hash
      expect(parsed_json[:data][:id]).to be_a String
    end
  end
end