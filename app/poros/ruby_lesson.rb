class RubyLesson
  attr_reader :id, :lesson, :topic, :link

  def initialize(lesson)
    @id = lesson[:id]
    @lesson = lesson[:attributes][:lesson]
    @topic = lesson[:attributes][:topic]
    @link = lesson[:attributes][:link]
  end
end