require 'rails_helper'

RSpec.describe "Ruby Lessons Index" do
  it "should show a list of ruby lessons by name and link to their show page" do
    visit ruby_lessons_path

    # expect(page).to have_content("Arrays")
    expect(page).to have_content("1")

    # click_link "Arrays"
    click_link "1"

    expect(current_path).to eq(ruby_lesson_path(1))
    expect(page).to have_content("Topic: Data Types")
  end
end