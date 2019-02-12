class QuestionAttempt < ApplicationRecord
  # Constants
  SCORE = { right: 10, wrong: -5 }.freeze

  # Associations
  belongs_to :user, inverse_of: :question_attempts
  belongs_to :question, inverse_of: :question_attempts
  belongs_to :option, inverse_of: :question_attempts

  # Validations
  validates :question_id, uniqueness: { scope: :user_id, message: 'already attempted!' }
  validate proc { errors.add(:options, 'not relevant') unless option.in?(question.options) }

  # Callbacks
  after_initialize proc { self.user = User.current }

  # Delegates
  delegate :answer, to: :question

  # Scopes
  scope :successful,
        -> { joins(:option)
                 .where('question_attempts.option_id = options.id and options.is_answer = (?)', true) }

  def successful?
    QuestionAttempt.includes(:option).where(id: id, options: { is_answer: true }).present?
  end

  def score
    SCORE[successful? ? :right : :wrong]
  end
end
