class Quizset < ApplicationRecord
  # Associations
  has_many :quizzes, inverse_of: :quizset, dependent: :destroy
  has_many :questions, through: :quizzes
  has_many :options, through: :questions
  accepts_nested_attributes_for :quizzes
end
