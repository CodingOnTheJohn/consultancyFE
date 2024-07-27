require 'openai'

class OpenaiService
  OpenAI.configure do |config|
    config.access_token = Rails.application.credentials.OPEN_AI[:OPEN_AI_KEY]
  end

  def tell_me_more(topic)
    prompt = "Tell me more about #{topic}"
    client = OpenAI::Client.new
    response = client.chat(
      parameters: {
        model: "gpt-4o-mini-2024-07-18",
        messages: [{ role: "user", content: "#{prompt}"}],
        temperature: 0.5,
      })
    response.dig("choices", 0, "message", "content")
  end
end
