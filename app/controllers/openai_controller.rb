class OpenaiController < ApplicationController
  def tell_me_more
    markdown_response = OpenaiFacade.new.get_response(params)
    @response = markdown_to_html(markdown_response.response)

    respond_to do |format|
      format.turbo_stream do
        render turbo_stream: [
          turbo_stream.replace("tell-me-more-button", partial: "empty"),
          turbo_stream.replace("openai-response", partial: "openai_response", locals: { response: @response })
        ]
      end
    end
  end

  def markdown_to_html(content)
    renderer = Redcarpet::Render::HTML.new
    markdown = Redcarpet::Markdown.new(renderer, {
      autolink: true,
      tables: true,
      fenced_code_blocks: true,
      strikethrough: true,
      superscript: true,
      underline: true,
      highlight: true,
      quote: true,
      footnotes: true,
      lax_spacing: true
    })
    markdown.render(content).html_safe
  end
end
