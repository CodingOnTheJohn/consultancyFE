class RubyLessonsFacade
  def initialize
  end

  def all
    LessonService.new.all_ruby.map do |lesson|
      RubyLesson.new(lesson)
    end
  end
end