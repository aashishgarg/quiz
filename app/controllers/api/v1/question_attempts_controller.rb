module Api
  module V1
    class QuestionAttemptsController < ApplicationController
      # Before Actions
      before_action :set_quiz, only: %i[create]
      before_action :validate_question, only: %i[create]

      def create
        @question_attempt = QuestionAttempt.create(question_attempt_params)
        render json: { errors: @question_attempt.errors }, status: :unprocessable_entity unless @question_attempt.valid?
      end

      private

      def set_quiz
        @quiz = Quiz.find_by(id: params[:quiz_id])
        render json: { errors: { quiz: 'not found!' } }, status: :not_found unless @quiz
      end

      def validate_question
        valid = question_attempt_params[:question_id].in?(@quiz.question_ids)
        render json: { errors: { question: 'does not belong to quiz' } }, status: :not_found unless valid
      end

      def question_attempt_params
        params.require(:question_attempt).permit(:question_id, :option_id)
      end
    end
  end
end

