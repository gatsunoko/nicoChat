class Genre < ApplicationRecord
  has_many :rooms, dependent: :destroy
end
