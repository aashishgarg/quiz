class Quiz < ApplicationRecord
  # Associations
  belongs_to :question, inverse_of: :quizzes
  belongs_to :quizset, inverse_of: :quizzes

  # Validates
  validates :quizset, uniqueness: { scope: :question, message: 'should have unique quizzes' }
end
