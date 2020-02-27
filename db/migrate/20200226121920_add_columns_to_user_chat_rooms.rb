class AddColumnsToUserChatRooms < ActiveRecord::Migration[5.2]
  def change
    add_reference :user_chat_rooms, :user, foreign_key: true
    add_reference :user_chat_rooms, :chat_room, foreign_key: true
  end
end
