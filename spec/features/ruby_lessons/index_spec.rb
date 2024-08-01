require 'rails_helper'

RSpec.describe "Ruby Lessons Index" do
  it "should show a list of ruby lessons by name and link to their show page" do
    VCR.use_cassette("ruby_index") do
      visit ruby_lessons_path

      expect(page).to have_content("Lesson 1")

      click_link "Lesson 1"

      expect(current_path).to eq(ruby_lesson_path(1))
      expect(page).to have_content("Arrays are ordered")
    end
  end
end