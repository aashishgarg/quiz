class Option < ApplicationRecord

  # Associations
  belongs_to :question, inverse_of: :options
  validates_associated :question

  # Validations
  validates :description, presence: true, length: { minimum: 5 }
end
