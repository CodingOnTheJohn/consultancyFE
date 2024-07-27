class RubyLessonsFacade
  def initialize
  end

  def all
    LessonService.new.all_ruby.map do |lesson|
      RubyLesson.new(lesson)
    end
  end

  def detail(id)
    lesson = LessonService.new.ruby_lesson_detail(id.to_i)
    RubyLesson.new(lesson)
  end
end