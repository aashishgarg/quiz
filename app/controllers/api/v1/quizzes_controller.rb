module Api
  module V1
    class QuizzesController < ApplicationController
      # Before Actions
      before_action :set_quiz, only: %i[update show destroy]

      def create
        @quiz = Quiz.create(quiz_params)
        render json: { errors: @quiz.errors }, status: :unprocessable_entity unless @quiz.valid?
      end

      def update
        if @quiz.update(quiz_params)
          render 'create'
        else
          render json: { errors: @quiz.errors }, status: :unprocessable_entity unless @quiz
        end
      end

      def show; end

      # TODO: Pagination needs to be applied here
      def index
        @quiz = Quiz.all
      end

      def destroy
        if @quiz.destroy
          render json: { message: 'Deleted successfully!' }, status: :ok
        else
          render json: { errors: @quiz.errors }, status: :unprocessable_entity unless @quiz
        end
      end

      private

      def set_quiz
        @quiz = Quiz.find_by(id: params[:id])
        render json: { errors: { id: 'not found' } }, status: :not_found unless @quiz
      end

      def quiz_params
        params.require(:quiz).permit(:name, question_ids: [])
      end
    end
  end
end
