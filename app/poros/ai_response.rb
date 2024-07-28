class AiResponse
  attr_reader :response

  def initialize(data)
    @response = data[:data][:description]
  end
end
