module Api
  module V1
    class QuestionsController < ApplicationController
      # Before Actions
      before_action :set_question, only: %i[update show destroy]

      def create
        @question = Question.create(question_params)
        render json: { errors: @question.errors }, status: :unprocessable_entity unless @question.valid?
      end

      def update
        if @question.update(question_params)
          render 'create'
        else
          render json: { errors: @question.errors }, status: :unprocessable_entity unless @question
        end
      end

      def show; end

      # TODO: Pagination needs to be applied here
      def index
        @questions = Question.all
      end

      def destroy
        if @question.destroy
          render json: { message: 'Deleted successfully!' }, status: :ok
        else
          render json: { errors: @question.errors }, status: :unprocessable_entity unless @question
        end
      end

      private

      def set_question
        @question = Question.find_by(id: params[:id])
        render json: { errors: { id: 'not found' } }, status: :not_found unless @question
      end

      def question_params
        params.require(:question).permit(:description, options_attributes: [:id, :_destroy, :description, :is_answer])
      end
    end
  end
end
