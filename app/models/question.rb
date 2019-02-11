class Question < ApplicationRecord
  # Associations
  has_many :options, inverse_of: :question
  has_one :answer, -> { answers }, class_name: 'Option'
  has_and_belongs_to_many :quizzes
  has_many :question_attempts, inverse_of: :question, dependent: :destroy
  has_many :attempted_by_users, class_name: 'User', through: :question_attempts

  accepts_nested_attributes_for :options

  # Validations
  validates :description, presence: true, length: { minimum: 5 }
  validates_length_of :options, minimum: 2, maximum: 4, message: 'should be between 2 and 4'
end
