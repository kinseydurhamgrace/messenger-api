require 'rails_helper'

RSpec.describe 'Messages', type: :request do
  describe 'Creating a message' do
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

  describe 'retrieving recent messages from a specific sender' do
    let(:sender_id) { User.create.id }
    let(:other_sender_id) { User.create.id }
    let(:recipient_id) { User.create.id }
    let(:params) do
      {
          sender_id: sender_id,
          recipient_id: recipient_id,
      }
    end
    let!(:message_1) { Message.create!(sender_id: sender_id, recipient_id: recipient_id, body: 'Hi!') }
    let!(:message_2) { Message.create!(sender_id: other_sender_id, recipient_id: recipient_id, body: 'Should not show up.') }

    before do
      get "/messages/#{recipient_id}/recent/#{sender_id}"
    end

    it 'retrieves the correct messages' do
      parsed_response = JSON.parse(response.body)
      expect(parsed_response.length).to eq 1
      expect(parsed_response.first['body']).to eq 'Hi!'
      expect(parsed_response.first['recipient_id']).to eq recipient_id
      expect(parsed_response.first['sender_id']).to eq sender_id
    end

    context 'when the specific sender does not exist' do
    end

    context 'when there are no recent messages' do
      let!(:message_1) { Message.create!(sender_id: sender_id, recipient_id: recipient_id, body: 'Hi!', created_at: 3.months.ago) }

      it 'does not show the old messages' do
        parsed_response = JSON.parse(response.body)
        expect(parsed_response.length).to eq 0
      end
    end
  end
end
