class Question < ApplicationRecord
  # Associations
  has_many :options, inverse_of: :question
  has_and_belongs_to_many :quizzes

  # has_and_belongs_to_many :answer, class_name: 'Option', join_table: 'answers_questions', before_add: proc { |q, o| q.answer.clear }
  # has_many :attempts, inverse_of: :question, dependent: :destroy
  accepts_nested_attributes_for :options

  # Validations
  validates :description, presence: true, length: { minimum: 5 }
  validates_length_of :options, minimum: 2, maximum: 4, message: 'should be between 2 and 4'
end
