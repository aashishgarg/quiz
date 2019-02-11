module Api
  module V1
    class QuizsetsController < ApplicationController
      def create
        @quizset = Quizset.create(quizset_params)
        render json: { errors: @quizset.errors }, status: :unprocessable_entity unless @quizset.valid?
      end

      private

      def quizset_params
        params.require(:quizset).permit(quizzes_attributes:
                                            [
                                                :id,
                                                :_destroy,
                                                question_attributes:
                                                    [
                                                        :id,
                                                        :_destroy,
                                                        :description,
                                                        options_attributes:
                                                            [
                                                                :description,
                                                                :id,
                                                                :_destroy
                                                            ]
                                                    ]
                                            ])
      end
    end
  end
end