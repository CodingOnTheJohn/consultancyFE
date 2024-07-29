class OpenAiFacade
  def initialize
    @service = OpenAiService.new
  end

  def get_response(topic)
    response = @service.get_response(topic)
    AiResponse.new(response)
  end
end
