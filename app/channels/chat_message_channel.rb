class ChatMessageChannel < ApplicationCable::Channel
  def subscribed
  	stream_from "chat_message_channel_#{params['chat_room_id']}"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def speak(data)
    #binding.pry
  	ChatMessage.create! user_id: data['user'], chat_room_id: params['chat_room_id'], body: data['message']
  end
end
