require 'rails_helper'

RSpec.describe 'User Login', type: :feature do
  describe 'User can Log in' do
    it 'Can log in a user' do
      visit login_form_path

      fill_in :email, with: "a"
      fill_in :password, with: "a"

      within(".navbar") do
        click_on "Log In"
      end

      expect(current_path).to eq(login_form_path)
    end
  end
end