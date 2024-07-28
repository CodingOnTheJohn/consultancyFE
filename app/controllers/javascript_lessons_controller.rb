class JavascriptLessonsController < ApplicationController
  def index
    @javascript_lessons = JavascriptLessonsFacade.new.all
  end

  def show
    @javascript_lesson = JavascriptLessonsFacade.new.detail(params[:id])
  end

  def ai_response
    @response = OpenAiFacade.new.get_response(params[:id])
  end
end
