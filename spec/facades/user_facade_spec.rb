require 'rails_helper'

RSpec.describe UserFacade do
  # VCR.use_cassette('cassette_name.yml') do
    it 'Can return users from BE db' do
      user = UserFacade.new.create_user	

      expect(user).to be_an(Hash)
      expect(user[:username]).to be_an(String)
      # expect(user.phone).to be_a(String)
      expect(user[:email]).to be_a(String)
      expect(user[:password]).to be_a(String)
    end
end