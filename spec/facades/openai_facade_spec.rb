require 'rails_helper'

RSpec.describe OpenaiFacade do
  describe '#get_response' do
    it 'returns an AiResponse object' do
      facade = OpenaiFacade.new
      lesson = { lesson: 'Ruby', topic: 'Programming' }

      allow_any_instance_of(OpenAiService).to receive(:tell_me_more).and_return({ data: { description: 'Test response' } })

      response = facade.get_response(lesson)

      expect(response).to be_an(AiResponse)

      expect(response.response).to eq('Test response')
    end
  end
end
