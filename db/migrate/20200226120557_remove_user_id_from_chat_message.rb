class RemoveUserIdFromChatMessage < ActiveRecord::Migration[5.2]
  def change
    remove_column :chat_messages, :user_id, :integer
  end
end
