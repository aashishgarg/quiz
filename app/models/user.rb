class User < ApplicationRecord
  # Inclusions
  has_secure_password

  # Associations

  # Validations
  validates :email, presence: true, uniqueness: true
  validates :name, presence: true, length: { minimum: 2, maximum: 199 }

  # Get current user
  def self.current
    Thread.current[:user]
  end

  # Set current user
  def self.current=(user)
    Thread.current[:user] = user
  end
end
