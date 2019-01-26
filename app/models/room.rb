class Room < ApplicationRecord
  has_many :messages, dependent: :destroy
  belongs_to :genre, optional: true

  enum genre_id: { news: 1, chat: 2 }
end
