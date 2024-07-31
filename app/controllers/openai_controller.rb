class OpenaiController < ApplicationController
  def tell_me_more
    @response = OpenaiFacade.new.get_response(params)

    respond_to do |format|
      format.turbo_stream do
        render turbo_stream: [
          turbo_stream.replace("tell-me-more-button", partial: "empty"),
          turbo_stream.replace("openai-response", partial: "openai_response", locals: { response: @response })
        ]
      end
    end
  end
end
