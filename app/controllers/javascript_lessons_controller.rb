class JavascriptLessonsController < ApplicationController
  def index
    @javascript_lessons = JavascriptLessonsFacade.new.all
  end

  def show
    @topic = "Javascript Lesson"
    @lesson = JavascriptLessonsFacade.new.detail(params[:id])
    render "shared/lesson_show"
  end

  def get_ai_response
    @response = OpenAiFacade.new.get_response(params[:id])
  end
end
