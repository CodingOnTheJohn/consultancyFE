require 'rails_helper'

RSpec.describe UserService do
  it 'can make API call to database' do
    attrs = {
      username: "test",
      email: "test@test.com"
    }
    query = UserService.new.create_user(attrs)[:data]
    expect(query).to be_an Hash
    expect(query).to have_key(:id)
    expect(query[:id]).to be_an String

    expect(query).to have_key(:type)
    expect(query[:type]).to eq("user")

    expect(query).to have_key(:attributes)
    expect(query[:attributes]).to be_an Hash

    expect(query[:attributes]).to have_key(:email)
    expect(query[:attributes][:email]).to be_an String

    expect(query[:attributes]).to have_key(:username)
    expect(query[:attributes][:username]).to be_an String
  end

  xit 'can make API call to database' do

    query = UserService.new.get_user
    # expect(query).to be_an Hash
    # expect(query).to have_key(:id)
    # expect(query[:id]).to be_an String

    # expect(query).to have_key(:type)
    # expect(query[:type]).to eq("user")

    # expect(query).to have_key(:attributes)
    # expect(query[:attributes]).to be_an Hash

    # expect(query[:attributes]).to have_key(:email)
    # expect(query[:attributes][:email]).to be_an String

    # expect(query[:attributes]).to have_key(:username)
    # expect(query[:attributes][:username]).to be_an String
  end
end