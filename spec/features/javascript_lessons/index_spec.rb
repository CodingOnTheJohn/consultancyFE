require 'rails_helper'

RSpec.describe "Javascript Lessons Index" do
  it "should show a list of javascript lessons by name and link to their show page" do
    VCR.use_cassette("javascript_index") do
      visit javascript_lessons_path

      expect(page).to have_content("Lesson 1")

      click_link "Lesson 1"

      expect(current_path).to eq(javascript_lesson_path(1))
      expect(page).to have_content("Objects are used to store")
    end
  end
end