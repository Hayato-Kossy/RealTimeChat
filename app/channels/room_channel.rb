class RoomChannel < ApplicationCable::Channel
  def subscribed
    @room = Room.find(params["room"])
    # stream_from "room_channel_#{params['room_id']}"
    stream_from "room_channel_#{params['room']}"
    end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def speak(data)
    # ActionCable.server.broadcast('room_channel', {message: data['message']})
    # Message.create! content: data['message']
    message = @room.messages.create!(content: data['message'])
    self.class.broadcast_to(@room, {message: render_message(message)})
  end

  # def speak(data)
  #   ActionCable.server.broadcast('room_channel', message: data['message'])
  #   Message.create!(content: data['message'], room_id: params['room_id'])
  # end
  
  private

  def render_message(message)
    ApplicationController.renderer.render(partial: 'messages/message', locals: { message: message })
  end
end
