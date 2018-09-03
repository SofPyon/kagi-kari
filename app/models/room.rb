class Room < ApplicationRecord
  has_many :activities, dependent: :destroy
  validates :name, presence: true, length: { maximum: 30 }
end
