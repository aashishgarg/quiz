class User < ApplicationRecord
  # Inclusions
  has_secure_password

  # Associations
  has_many :question_attempts, inverse_of: :user, dependent: :destroy
  has_many :attempted_questions, class_name: 'Question', through: :question_attempts, source: :question
  has_many :attempted_quizzes, class_name: 'Quiz', through: :attempted_questions, source: :quizzes

  # Validations
  validates :email, presence: true, uniqueness: true
  validates :name, presence: true, length: { minimum: 2, maximum: 199 }

  # Get current user
  def self.current
    Thread.current[:user]
  end

  # Set current user
  def self.current=(user)
    Thread.current[:user] = user
  end

  def score
    question_attempts.collect(&:score).inject(&:+)
  end
end
