class User < ApplicationRecord
  # Inclusions
  has_secure_password

  # Validations
  validates :email, presence: true, uniqueness: true
  validates :name, presence: true, length: { minimum: 2, maximum: 199 }
end
