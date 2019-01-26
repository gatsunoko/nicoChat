class RoomChannel < ApplicationCable::Channel
  def subscribed
    stream_from "room_channel#{params[:room]}"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def speak(data)
    room = Room.find(params['room'].to_i)
    master = false
    if current_user.present? && current_user.id == room.user.id
      master = true
    end
    # params['room'] に現在のroomが入っている
    Message.create!(text: data['message'], room_id: params['room'], master: master)
  end
end
