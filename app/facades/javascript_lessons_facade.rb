class JavascriptLessonsFacade
  def initialize
  end

  def all
    LessonService.new.all_javascript.map do |lesson|
      JavascriptLesson.new(lesson)
    end
  end

  def detail(id)
    lesson = LessonService.new.javascript_lesson_detail(id.to_i)
    JavascriptLesson.new(lesson)
  end
end