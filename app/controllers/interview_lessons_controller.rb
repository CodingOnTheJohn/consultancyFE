class InterviewLessonsController < ApplicationController
  def index
    @interview_lessons = InterviewLessonsFacade.new.all
  end

  def show
    @interview_lesson = InterviewLessonsFacade.new.detail(params[:id])
  end

  def get_ai_response
    @response = OpenAiFacade.new.get_response(params[:id])
  end
end
