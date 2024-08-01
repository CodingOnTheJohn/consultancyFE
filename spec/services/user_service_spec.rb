require "rails_helper"

RSpec.describe UserService do
  describe "#create_user" do
  it "should return a response body parsed from JSON" do
    VCR.use_cassette("create_user") do
        service = UserService.new
        parsed_json = service.create_user({"username"=>"acjtesting5", "password"=>"test", "email"=>"test4554@example.com", "password_confirmation"=>"test"})

        expect(parsed_json).to be_a Hash
        expect(parsed_json[:id]).to be_a String
      end
    end
  end
end