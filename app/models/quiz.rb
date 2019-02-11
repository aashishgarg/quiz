class Quiz < ApplicationRecord
  # Associations
  belongs_to :question, inverse_of: :quizzes
  belongs_to :quizset, inverse_of: :quizzes
  accepts_nested_attributes_for :question

  # Validates
  validates :quizset, uniqueness: { scope: :question, message: 'should have unique quizzes' }
end
