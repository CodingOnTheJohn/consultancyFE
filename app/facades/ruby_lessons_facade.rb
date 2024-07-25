class RubyLessonsFacade
  def initialize
  end

  def all
    LessonService.new.all_ruby.map do |lesson|
      RubyLesson.new(lesson)
    end
  end

  def detail
    LessonService.new.ruby_lesson_detail(params[:id])
  end
end