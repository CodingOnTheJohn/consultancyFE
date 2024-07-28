class RubyLessonsController < ApplicationController
  def index
    @ruby_lessons = RubyLessonsFacade.new.all
  end

  def show
    @ruby_lesson = RubyLessonsFacade.new.detail(params[:id])
  end

  def ai_response
    @response = OpenAiFacade.new.get_response(params[:id])
  end
end
