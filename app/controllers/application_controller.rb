class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :current_user, :logged_in? #makes the methods available to views

  def current_user
  	@current_user ||= Diver.find(session[:diver_id]) if session[:diver_id]
  end

  def logged_in?
  	!!current_user
  end

end
