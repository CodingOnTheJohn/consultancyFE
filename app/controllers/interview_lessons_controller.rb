class InterviewLessonsController < ApplicationController
  def index
    @interview_lessons = InterviewLessonsFacade.new.all
  end

  def show
    @topic = "Interview Lesson"
    @lesson = InterviewLessonsFacade.new.detail(params[:id])
    render "shared/lesson_show"
  end

  def get_ai_response
    @response = OpenAiFacade.new.get_response(params[:id])
  end
end
