require 'rails_helper'

RSpec.describe "Interview Lessons Index" do
  it "should show a list of interview lessons by name and link to their show page" do
    visit interview_lessons_path

    # expect(page).to have_content("Explain the following Data Types")
    expect(page).to have_content("1")

    # click_link "Explain the following Data Types"
    click_link "1"

    expect(current_path).to eq(interview_lesson_path(1))
    expect(page).to have_content("Topic: Data Types")
  end
end