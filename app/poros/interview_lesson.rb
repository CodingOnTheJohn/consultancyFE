class InterviewLesson
  attr_reader :id, :question, :topic, :link

  def initialize(lesson)
    @id = lesson[:id]
    @question = lesson[:attributes][:question]
    @topic = lesson[:attributes][:topic]
    @link = lesson[:attributes][:link]
  end
end