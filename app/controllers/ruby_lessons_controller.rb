class RubyLessonsController < ApplicationController
  def index
    @ruby_lessons = RubyLessonsFacade.new.all
  end
end