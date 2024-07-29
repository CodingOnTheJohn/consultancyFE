require 'rails_helper'

RSpec.describe OpenAiService do
  describe '#tell_me_more' do
    it 'returns a parsed JSON response' do
      service = OpenAiService.new

      mock_response = double('response')
      allow(mock_response).to receive(:dig).and_return('{"data":{"description":"Test response"}}')

      allow_any_instance_of(OpenAI::Client).to receive(:chat).and_return(mock_response)

      result = service.tell_me_more('Ruby', 'Programming')

      expect(result).to eq({ data: { description: 'Test response' } })
    end
  end
end
