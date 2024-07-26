class InterviewLessonsFacade
  def initialize
  end

  def all
    LessonService.new.all_interview.map do |lesson|
      InterviewLesson.new(lesson)
    end
  end

  def detail(id)
    lesson = LessonService.new.interview_lesson_detail(id.to_i)
    InterviewLesson.new(lesson)
  end
end