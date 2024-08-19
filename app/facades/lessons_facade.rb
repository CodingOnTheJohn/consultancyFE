class LessonsFacade
  def initialize(lesson_type)
    @lesson_type = lesson_type
  end

  def all
    LessonService.new.all_lessons(@lesson_type).map do |lesson|
      Lesson.new(lesson)
    end
  end

  def detail(id)
    lesson = LessonService.new.lesson_detail(@lesson_type, id.to_i)
    Lesson.new(lesson)
  end
end