class User < ApplicationRecord
  has_many :activities, dependent: :destroy
  validates :screen_name, presence: true, length: { minimum: 3, maximum: 20 }
  validates :name,        presence: true, length: { maximum: 20 }
  has_secure_password
  validates :password,    presence: true, length: { minimum: 8 }

  # Make digest
  def self.digest(unencrypted)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                  BCrypt::Engine.cost
    BCrypt::Password.create(unencrypted, cost: cost))
  end
end
