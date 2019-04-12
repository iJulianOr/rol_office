class MessageBroadcastJob < ApplicationJob
  queue_as :default

  def perform(message, user)
    return broadcast_bot(message, user) if user.is_a? Bot
    Message.create(content: 'Bot message', sender: Bot.first) if message.content =~ /!pute/
    broadcast_sender(message, user)
    broadcast_receiver(message, user)
  end

  private

  def broadcast_bot(message, bot = Bot.first)
    User.all.each do |user|
      ActionCable.server.broadcast "room_channel-#{user.id}", message: render_message(message, bot), user_id: 0
    end
  end

  def broadcast_sender(message, user)
    ActionCable.server.broadcast "room_channel-#{user.id}", message: render_message(message, user), user_id: user.id
  end

  def broadcast_receiver(message, sender_user)
    users = User.where.not(id: sender_user.id)
    users.each do |user|
      ActionCable.server.broadcast "room_channel-#{user.id}", message: render_message(message, user), user_id: user.id
    end
  end

  def render_message(message, user)
    ApplicationController.renderer.render(partial: 'messages/message', locals: { message: message, current_user: user })
  end
end
