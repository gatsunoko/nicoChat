class Room < ApplicationRecord
  has_many :messages, dependent: :destroy
  belongs_to :genre, optional: true
  belongs_to :user, optional: true

  validates :title, presence: true, length: { minimum: 2, maximum: 200 }

  enum genre_id: { news: 1, chat: 2 }
end
