module Api
  module V1
    class QuizsetsController < ApplicationController
      # Before Actions
      before_action :set_quizset, only: %i[update]

      def create
        @quizset = Quizset.create(quizset_params)
        render json: { errors: @quizset.errors }, status: :unprocessable_entity unless @quizset.valid?
      end

      def update
        if @quizset.update(quizset_params)
          render 'create'
        else
          render json: { errors: @quizset.errors }, status: :unprocessable_entity
        end
      end

      private

      def set_quizset
        @quizset = Quizset.find_by(id: params[:id])
        render json: { errors: { id: 'not found' } }, status: :not_found unless @quizset
      end

      def quizset_params
        params.require(:quizset).permit(:name, quiz_ids: [])
      end
    end
  end
end