class Option < ApplicationRecord
  # Associations
  belongs_to :question, inverse_of: :options

  # Validations
  validates :description, presence: true, length: { minimum: 5 }
  validates_associated :question
end
