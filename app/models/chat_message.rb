class ChatMessage < ApplicationRecord
	belongs_to :user
	belongs_to :chat_room

  after_create_commit { ChatMessageBroadcastJob.perform_later self }

	def user_name
		return '名無しさん' if user_id.blank?
		user.name
	end

end

