class InterviewLesson
  attr_reader :id, :lesson, :topic, :link

  def initialize(lesson)
    @id = lesson[:id]
    @lesson = lesson[:attributes][:question]
    @topic = lesson[:attributes][:topic]
    @link = lesson[:attributes][:link]
  end
end
