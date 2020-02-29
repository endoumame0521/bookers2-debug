class ChatRoom < ApplicationRecord
	has_many :user_chat_rooms
	has_many :chat_messages
end
