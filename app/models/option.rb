class Option < ApplicationRecord
  # Associations
  belongs_to :question, inverse_of: :options
  has_many :question_attempts, inverse_of: :option, dependent: :destroy
  has_many :attempted_options, class_name: 'Option', through: :question_attempts

  # Validations
  validates :description, presence: true, length: { minimum: 5 }
  validates_associated :question

  # Scope
  scope :answers, -> { where(is_answer: true) }
end
