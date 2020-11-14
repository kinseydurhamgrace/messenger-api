class MessagesController < ApplicationController
  def create
    message = Message.create({
                    sender_id: User.find(params['sender_id']).id,
                    recipient_id: User.find(params['recipient_id']).id,
                    body: params['message_body']
                   })

    render json: message, status: :created
  end
end
