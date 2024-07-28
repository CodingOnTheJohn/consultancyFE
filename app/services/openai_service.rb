require 'openai'

class OpenaiService
  OpenAI.configure do |config|
    config.access_token = Rails.application.credentials.OPEN_AI[:OPEN_AI_KEY]
  end

  def tell_me_more(topic)
    prompt = "Tell me more about #{topic}. please give me the response in json and only json format. do not include any other information. only a JSON object, do not put it in an array, in quotes or anything else.I want the json object to have the key data with only description nested under data"
    client = OpenAI::Client.new
    response = client.chat(
      parameters: {
        model: "gpt-4o-mini-2024-07-18",
        response_format: { type: "json_object" },
        messages: [{ role: "user", content: "#{prompt}"}],
        temperature: 0.5,
      })
    content = response.dig("choices", 0, "message", "content")
    JSON.parse(content, symbolize_names: true)
  end
end
