class Message < ApplicationRecord
  after_create_commit :send_message
  belongs_to :sender, polymorphic: true

  private

  def send_message
    MessageBroadcastJob.perform_later self, sender
    self.class.create(content: 'This is from the bot', entity: Bot.first) if content =~ /!pute/
  end
end
