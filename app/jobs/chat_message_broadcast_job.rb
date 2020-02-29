class ChatMessageBroadcastJob < ApplicationJob
  queue_as :default

  def perform(chat_message)
    ActionCable.server.broadcast "chat_message_channel_#{chat_message.chat_room_id}", user_name: chat_message.user_name, message: chat_message.body
  end
end
