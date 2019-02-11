class Quiz < ApplicationRecord
  # Constants
  SIZE = 1

  # Associations
  has_and_belongs_to_many :questions
  has_and_belongs_to_many :quizsets

  # Validates
  validate proc { errors.add(:questions, "cannot exceed #{SIZE}") if questions.size > SIZE }
end
