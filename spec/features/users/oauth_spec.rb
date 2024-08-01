require "rails_helper"

RSpec.feature "OAuth", type: :feature do
  describe "GitHub OAuth" do
    it "allows a user to login with GitHub" do
      visit login_form_path

      click_link "Login with GitHub"
    end
  end
end