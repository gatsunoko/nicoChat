class Message < ApplicationRecord
  belongs_to :room
  after_create_commit { MessageBroadcastJob.perform_later self }

  validates :text, presence: true, length: { minimum: 1, maximum: 1000 }
end
