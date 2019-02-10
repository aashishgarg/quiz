class Question < ApplicationRecord

  # Associations
  has_many :options, inverse_of: :question
  validates_length_of :options, maximum: 4, message: 'cannot be more than 4'
  has_and_belongs_to_many :answer, class_name: 'Option', join_table: 'answers_questions',
                          before_add: proc { |q, o| q.answer.clear }
  accepts_nested_attributes_for :options

  # Validations
  validates :description, presence: true, length: { minimum: 5 }
end
