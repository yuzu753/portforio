class RoomChannel < ApplicationCable::Channel
  def subscribed
    stream_from "room_channel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def speak(data)
    message = ChatMessage.new(chat_room_id: params['chat_room_id'], user_id: current_user.id, message: data["message"])
    message.save!
    image = current_user.profile_image
    # if current_user.profile_image.attached?
  	ActionCable.server.broadcast 'room_channel', message: render_message(message), created_at: message.created_at.strftime('%m/%d %H:%M')
    # else
    # ActionCable.server.broadcast 'room_channel', message: render_message(message), profile_image: nil
    # end
  end

  def render_message(message)
    ApplicationController.renderer.render(partial: 'messages/message', locals: { message: message })
  end
end
