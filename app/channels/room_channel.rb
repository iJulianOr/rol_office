class RoomChannel < ApplicationCable::Channel
  def subscribed
    stream_from "room_channel-#{current_user.id}"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def speak(data)
    User.current = current_user
    Message.create! content: data['message']['value'], sender: current_user
  end
end
