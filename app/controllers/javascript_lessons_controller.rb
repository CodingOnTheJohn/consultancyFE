class JavascriptLessonsController < ApplicationController
  def index
    @javascript_lessons = JavascriptLessonsFacade.new.all
  end

  def show
    @javascript_lesson = JavascriptLessonsFacade.new.detail(params[:id])
  end
end