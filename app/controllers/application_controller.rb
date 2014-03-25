class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  include ApplicationHelper
  protect_from_forgery with: :exception
  helper_method :current_user
  before_action :set_current_user
  before_action :set_categories
  before_action :set_client
  before_action :change_view_path

  def current_user
    @current_user ||= session[:user] if session[:user]
  end

  def set_current_user
    gon.current_user = current_user unless @current_user else false
  end

  def set_categories
    @categories = Category.all 
  end

  def set_client
    if current_user      
      @client = get_client(current_user[:oauth_token], current_user[:oauth_token_secret])
    end
  end

  def change_view_path 
    if request.user_agent !=~ /Mobile|webOS/ || params[:m] == 'y'
      prepend_view_path "app/views/mobile"
    end
  end
end
