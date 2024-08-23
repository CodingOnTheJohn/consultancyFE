require 'openai'

class OpenAiService
  OpenAI.configure do |config|
    config.access_token = Rails.application.credentials.OPEN_AI[:OPEN_AI_KEY]
  end

  def tell_me_more(lesson, topic)
    Rails.cache.fetch("openai_response_#{lesson}_#{topic}", expires_in: 1.week) do
      prompt = "Tell me about #{lesson} as a small #{topic} like I know very little of the topic in under 250 words. please give me the response in json and only json format. do not include any other information. only a JSON object, do not put it in an array, in quotes or anything else. I want the json object to have the key data with only description nested under data. I want the data to be in markdown format. my response should be in markdown format, and should only be able to parse with these rules autolink: true, tables: true, fenced_code_blocks: true, strikethrough: true, superscript: true, underline: true, highlight: true, quote: true, footnotes: true, lax_spacing: true"
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
end
