module Api
  module V1
    class UsersController < ApplicationController
      skip_before_action :authenticate_user!, only: %i[index]

      def index
        @users = params[:top].present? ? User.top : User.all
      end
    end
  end
end
