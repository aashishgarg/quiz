class RegistrationsController < ApplicationController
  # Before Actions
  skip_before_action :authenticate_user!
  before_action :confirm_password, only: %i[create]

  def create
    @user = User.create(registration_params)
    render json: { errors: @user.errors }, status: :unprocessable_entity unless @user.valid?
  end

  private

  def confirm_password
    confirmation = registration_params[:password_confirmation].present?
    render json: { errors: { password_confirmation: ["doesn't match Password"] } },
           status: :unprocessable_entity unless confirmation
  end

  def registration_params
    params.require(:user).permit(:name, :email, :is_admin, :password, :password_confirmation)
  end
end
