class ChatController < ApplicationController
  def index
  	@chat = ChatRoom.all
  end

  def create
  end

  def show
    @messages = ChatMessage.all
  end
end
