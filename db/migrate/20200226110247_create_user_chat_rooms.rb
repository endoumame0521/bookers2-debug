class CreateUserChatRooms < ActiveRecord::Migration[5.2]
  def change
    create_table :user_chat_rooms do |t|

      t.timestamps
    end
  end
end
