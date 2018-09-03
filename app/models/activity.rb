class Activity < ApplicationRecord
  belongs_to :user
  belongs_to :room
  enum action: { borrowing: 1, returning: 0 }
  validates :action, presence: true
end
