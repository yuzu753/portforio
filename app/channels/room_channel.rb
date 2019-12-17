class RoomChannel < ApplicationCable::Channel
  def subscribed
    stream_from "room_channel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def speak(data)
    message = ChatMessage.create!(chat_room_id: params['chat_room_id'], user_id: current_user.id, message: data["message"])
  	ActionCable.server.broadcast 'room_channel', message: render_message(message)
  end

  def render_message(message)
    ApplicationController.renderer.render(partial: 'messages/message', locals: { message: message })
  end
end
