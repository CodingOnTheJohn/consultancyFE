require 'rails_helper'

RSpec.describe "Interview Lessons Index" do
  it "should show a list of interview lessons by name and link to their show page" do
    json_response_index = File.read("spec/fixtures/interview_lessons.json")
    stub_request(:get, "https://codinglessons-112e8fb1f399.herokuapp.com/api/v1/interview").
    to_return(status: 200, body: json_response_index, headers: {})

    json_response_show = File.read("spec/fixtures/interview_lesson.json")
    stub_request(:get, "https://codinglessons-112e8fb1f399.herokuapp.com/api/v1/interview/1").
    to_return(status: 200, body: json_response_show, headers: {})

    visit interview_lessons_path

    expect(page).to have_content("Lesson 1")

    click_link "Lesson 1"

    expect(current_path).to eq(interview_lesson_path(1))
    expect(page).to have_content("Explain the following Data Types")
  end
end