class ChatMessagesController < ApplicationController
  def show
    @user = User.find(params[:id])
    chat_rooms = current_user.user_chat_rooms.pluck(:chat_room_id)
    user_chat_rooms = UserChatRoom.find_by(user_id: @user.id, chat_room_id: chat_rooms)

    unless user_chat_rooms.nil?
      @chat_room = user_chat_rooms.chat_room
    else
      @chat_room = ChatRoom.new
      @chat_room.save
      UserChatRoom.create(user_id: current_user.id, chat_room_id: @chat_room.id)
      UserChatRoom.create(user_id: @user.id, chat_room_id: @chat_room.id)
    end
    @chat_messages = @chat_room.chat_messages
  end
end