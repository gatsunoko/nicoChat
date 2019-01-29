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
    username = "名無しさん"
    if current_user.present? && current_user.id == room.user.id
      username = current_user.name
      master = true
    end

    uuid = self.connection.ip_addr.crypt("#{ENV['CRYPT_KEY']}")
    uuid.slice!(0, 2)

    # params['room'] に現在のroomが入っている
    Message.create!(text: data['message'], room_id: params['room'], master: master, username: username, uuid: uuid)
  end
end
