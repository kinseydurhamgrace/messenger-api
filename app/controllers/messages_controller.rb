class MessagesController < ApplicationController
  def create
    message = Message.create({
              sender_id: sender_id,
              recipient_id: recipient_id,
              body: params['message_body']
             })
    render json: message, status: :created
  end

  def most_recent_from_sender
    messages = Message.most_recent.where(
        recipient_id: recipient_id,
        sender_id: sender_id
    )
    render json: messages, status: :ok
  end

  private

  def recipient_id
    @recipient_id ||= User.find(params['recipient_id']).id
  end

  def sender_id
    @sender_id ||= User.find(params['sender_id']).id
  end

  def message_params
    params.require(:message).permit(:sender_id, :recipient_id, :body)
  end
end
