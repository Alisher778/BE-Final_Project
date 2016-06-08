class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_filter :configure_devise_params, if: :devise_controller?
  def configure_devise_params
    devise_parameter_sanitizer.for(:sign_up) do |u|
      u.permit(:first_name, :last_name, :gender, :email, :age, :photo, :password, :password_confirmation)
    end
  end

  # helper_method :current_user, :logged_in?

  # def current_user
  #   @current_user ||= User.find(session[:user_id]) if session[:user_id]
  # end

  # def logged_in?
  #   !!current_user
  # end

  # def require_user
  #   if !logged_in?
  #     flash[:danger] = "You must be logged in to perform this action"
  #     redirect_to root_path
  #   end
  # end
end
