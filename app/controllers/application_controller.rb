class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  helper_method :current_user

  @client_id = "f52797da1ca750c9f089"

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def validate_user
    unless current_user
      flash[:errors] = "You must be a registered user to access this feature"
      redirect_to root_path
    end
  end
end

