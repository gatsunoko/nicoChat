class Category < ApplicationRecord
  has_many :rooms, dependent: :destroy

  validates :title, presence: true, length: { minimum: 2, maximum: 200 }
end
