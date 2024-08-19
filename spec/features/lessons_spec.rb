require 'rails_helper'

RSpec.describe "Lessons Index" do
  it "should show a list of ruby lessons by name and link to their show page" do
    VCR.use_cassette("ruby_lesson_localhost5000") do
      visit lessons_path(type: "ruby")

      expect(page).to have_content("Lesson: Arrays")

      click_link "Lesson: Arrays"

      expect(current_path).to eq(lesson_path(7))
      expect(page).to have_content("Arrays are ordered")
    end
  end

  it "should show a list of ruby lessons by name and link to their show page" do
    VCR.use_cassette("javascript_lesson_localhost5000") do
      visit lessons_path(type: "javascript")

      expect(page).to have_content("Lesson: Objects")

      click_link "Lesson: Objects"

      expect(current_path).to eq(lesson_path(4))
      expect(page).to have_content("Objects are used to store collections")
    end
  end

  it "should show a list of interview lessons by name and link to their show page" do
    VCR.use_cassette("interview_lesson_localhost5000") do
      visit lessons_path(type: "interview")

      expect(page).to have_content("Lesson: Data Types")

      click_link "Lesson: Data Types"

      expect(current_path).to eq(lesson_path(1))
      expect(page).to have_content("Explain the following Data Types")
    end
  end  
end