class RubyLessonsController < ApplicationController
  def index
    @ruby_lessons = RubyLessonsFacade.new.all
  end

  def show
    @topic = "Ruby Lesson"
    @lesson = RubyLessonsFacade.new.detail(params[:id])
    render "shared/lesson_show"
  end

  def get_ai_response
    @response = OpenAiFacade.new.get_response(params[:id])
  end
end
