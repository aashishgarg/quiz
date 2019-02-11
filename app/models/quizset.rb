class Quizset < ApplicationRecord
  # Associations
  has_and_belongs_to_many :quizzes
  has_many :questions, through: :quizzes
  has_many :options, through: :questions
end
