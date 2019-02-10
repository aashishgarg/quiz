class ApplicationController < ActionController::API
  include ActionController::HttpAuthentication::Basic::ControllerMethods

  # Before Actions
  before_action :authenticate_user!


  def authenticate_user!
    user = authenticate_with_http_basic { |email, pwd| User.find_by(email: email).authenticate(pwd) }
    user ? (User.current = user) : (head :unauthorized)
  end

  def current_user
    User.current
  end
end
