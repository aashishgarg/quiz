class QuestionAttempt < ApplicationRecord
  # Constants
  SCORE = { right: 10, wrong: -5 }.freeze

  # Associations
  belongs_to :user, inverse_of: :question_attempts
  belongs_to :question, inverse_of: :question_attempts
  belongs_to :option, inverse_of: :question_attempts

  # Validations
  validates :question_id, uniqueness: { scope: :user_id, message: 'already attempted!' }
  validate :own_options_only

  # Callbacks
  after_initialize proc { self.user = User.current }

  # Delegates
  delegate :answer, to: :question

  def score
    question.answer == option ? SCORE[:right] : SCORE[:wrong]
  end

  private

  def own_options_only
    errors.add(:options, 'not relevant') unless option.in?(question.options)
  end
end
