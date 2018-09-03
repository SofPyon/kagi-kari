class Room < ApplicationRecord
  has_many :activities, dependent: :destroy
  validates :name, presence: true, length: { maximum: 30 }

  # A key for this room borrowed?
  #
  # To avoid N+1 problem, use below.
  # Room.includes(:activities)
  def borrowed?
    return false if activities.empty?
    activities.take.borrowing? 
  end
end
