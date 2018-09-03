class Room < ApplicationRecord
  has_many :activities, dependent: :destroy
end
