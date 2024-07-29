class OpenaiController < ApplicationController
  def tell_me_more
    @response = OpenaiFacade.new.get_response(params)

    respond_to do |format|
      format.turbo_stream do
        render turbo_stream: turbo_stream.replace(
          "openai-response",
          partial: "openai_response"
        )
      end
    end
  end
end
