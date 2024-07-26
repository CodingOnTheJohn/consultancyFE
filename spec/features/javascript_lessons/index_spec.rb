require 'rails_helper'

RSpec.describe "Javascript Lessons Index" do
  it "should show a list of javascript lessons by name and link to their show page" do
    visit javascript_lessons_path

    # expect(page).to have_content("Objects")
    expect(page).to have_content("1")

    # click_link "Objects"
    click_link "1"

    expect(current_path).to eq(javascript_lesson_path(1))
    expect(page).to have_content("Topic: Objects")
  end
end