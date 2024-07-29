class OpenaiFacade
  def initialize
    @service = OpenAiService.new
  end

  def get_response(lesson)
    response = @service.tell_me_more(lesson[:lesson], lesson[:topic])
    AiResponse.new(response)
  end
end
