class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :current_user
  before_action :set_current_user
  before_action :set_categories

  def current_user
    @current_user ||= session[:user] if session[:user]
  end

  def set_current_user
    gon.current_user = current_user unless @current_user else false
  end

  def set_categories
    @categories = Category.all 
  end
end
