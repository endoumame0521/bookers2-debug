class ChatRoom < ApplicationRecord
	has_many :chat_messages
	has_many :user_chat_rooms
end
