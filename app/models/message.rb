class Message < ApplicationRecord
  after_create_commit :send_message
  belongs_to :user

  private

  def send_message
    MessageBroadcastJob.perform_later self, User.current
  end
end
