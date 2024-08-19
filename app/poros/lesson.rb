class Lesson
  attr_reader :id, :lesson, :topic, :link, :lesson_type

  def initialize(lesson)
    binding.pry
    @id = lesson[:id]
    @lesson = lesson[:attributes][:lesson]
    @topic = lesson[:attributes][:topic]
    @link = lesson[:attributes][:link]
    @lesson_type = lesson[:attributes][:lesson_type]
  end
end