require 'rails_helper'

RSpec.describe 'Messages', type: :request do
  describe 'POST /messages' do
    let(:sender_id) { User.create.id }
    let(:recipient_id) { User.create.id }
    let(:body) { 'Four for you Glen Coco. You go Glen Coco!'}
    let(:params) do
      {
          sender_id: sender_id,
          recipient_id: recipient_id,
          message_body: body
      }
    end

    before { post '/messages', params: params }

    it 'returns the expected response' do
      parsed_response = JSON.parse(response.body)
      expect(parsed_response['body']).to eq 'Four for you Glen Coco. You go Glen Coco!'
      expect(parsed_response['recipient_id']).to eq recipient_id
      expect(parsed_response['sender_id']).to eq sender_id
    end

    it 'returns status code 201' do
      expect(response).to have_http_status(201)
    end
  end
end
