class RoomChannel < ApplicationCable::Channel
  def subscribed
    stream_from "room_channel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def speak(data)
    ActionCable.server.broadcast('room_channel', {message: data['message']})
    Message.create! content: data['message']
  end
  
  private

  def render_message(message)
    ApplicationController.renderer.render(partial: 'messages/message', locals: { message: message })
  end
end