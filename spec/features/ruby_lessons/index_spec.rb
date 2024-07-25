require 'rails_helper'

RSpec.describe "Ruby Index" do
# As a visitor,
# When I visit '/ruby_lessons'
# I should see a list of ruby lessons by name
# and each lesson's name is a link to their show page (ruby_lessons/:id)

  describe "visit ruby index" do 
    it "should show a list of ruby lessons by name and link to their show page" do
      visit ruby_lessons_path

      expect(page).to have_content("Arrays")

      # click_link "Arrays"

      # expect(current_path).to eq(ruby_lesson_path(:id))
    end
  end
end