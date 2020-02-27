class ChatMessage < ApplicationRecord
	after_create_commit { ChatMessageBroadcastJob.perform_later self }
	belongs_to :user
	belongs_to :chat_room

	def user_name
		return '名無しさん' if user_id.blank?
		user.name
	end
end
