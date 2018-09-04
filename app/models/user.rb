class User < ApplicationRecord
  attr_accessor :remember_token
  has_many :activities, dependent: :destroy
  validates :screen_name, presence: true, length: { minimum: 3, maximum: 20 }
  validates :name,        presence: true, length: { maximum: 20 }
  has_secure_password
  validates :password,    presence: true, length: { minimum: 8 }

  # Make digest
  def self.digest(unencrypted)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                  BCrypt::Engine.cost
    BCrypt::Password.create(unencrypted, cost: cost)
  end

  # Make new token
  def self.new_token
    SecureRandom::urlsafe_base64
  end

  # Set remember token
  def remember
    self.remember_token = User.new_token
    update_attribute(:remember_digest, User.digest(remember_token))
  end

  def authenticate_remember?(token)
    return false if token.blank?
    BCrypt::Password.new(remember_digest) == token
  end

  # Remove remember token
  def forget
    update_attribute(:remember_digest, nil)
  end
end
