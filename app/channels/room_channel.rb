class RoomChannel < ApplicationCable::Channel
  def subscribed
    stream_from "room_channel#{params[:room]}"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def speak(data)
    # params['room'] に現在のroomが入っている
    Message.create!(text: data['message'], room_id: params['room'])
  end
end
