class User < ApplicationRecord
  has_many :activities, dependent: :destroy
  has_secure_password
end
