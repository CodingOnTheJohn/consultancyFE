class RubyLessonsController < ApplicationController
  def index
    @ruby_lessons = RubyLessonsFacade.new.all
  end

  def show
    @ruby_lesson = RubyLessonsFacade.new.detail(params[:id])
  end
end