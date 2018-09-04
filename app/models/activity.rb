class Activity < ApplicationRecord
  belongs_to :user
  belongs_to :room
  enum action: { borrowing: 1, returning: 0 }
  validates :action, presence: true
  validate :repeated_action_forbidden
  default_scope { order(created_at: :desc) }

  private

    # custom validator
    def repeated_action_forbidden
      room.reload
      if room.borrowed? && action == 'borrowing'
        errors.add(:action, ": Already borrowed.")
      elsif !room.borrowed? && action == 'returning'
        errors.add(:action, ": Already returned.")
      end
    end
end
