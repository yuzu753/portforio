class ChatController < ApplicationController
  before_action :authenticate_user!
  def index
    @chat = current_user.chat_rooms
  end

  def create
    # ログインユーザーの持っているチャットルームを探す、なければ作成
    current_user_chat_rooms = ChatRoomUser.where(user_id: current_user.id).map(&:chat_room)
    chat_room = ChatRoomUser.where(chat_room: current_user_chat_rooms, user_id: params[:user_id]).map(&:chat_room).first
    if chat_room.blank?
      @chat_room = ChatRoom.new
      @chat_room.chat_room_users.new(user_id: current_user.id)
      @chat_room.chat_room_users.new(user_id: params[:user_id])
      @chat_room.save
       redirect_to chat_path(@chat_room.id)
    else
       redirect_to action: :show, id: chat_room.id
    end
  end

  def show
    @room = ChatRoom.find(params[:id])
    @messages = @room.chat_messages.all
  end
end
