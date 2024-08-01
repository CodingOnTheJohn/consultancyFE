class InterviewLessonsController < ApplicationController
  def index
    @user = UserFacade.new.get_user(session[:user_id]) if session[:user_id]
    @interview_lessons = InterviewLessonsFacade.new.all
  end

  def show
    @user = UserFacade.new.get_user(session[:user_id]) if session[:user_id]
    @topic = "Interview Lesson"
    @lesson = InterviewLessonsFacade.new.detail(params[:id])
    render "shared/lesson_show"
  end

  def get_ai_response
    @response = OpenAiFacade.new.get_response(params[:id])
  end
end
