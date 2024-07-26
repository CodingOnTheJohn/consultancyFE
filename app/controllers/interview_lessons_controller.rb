class InterviewLessonsController < ApplicationController
  def index
    @interview_lessons = InterviewLessonsFacade.new.all
  end

  def show
    @interview_lesson = InterviewLessonsFacade.new.detail(params[:id])
  end
end