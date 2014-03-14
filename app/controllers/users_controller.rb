class UsersController < ApplicationController
  before_action :set_params

  def show
    @user = Twitter.user(params[:id].to_i)
    render :layout => nil
  end

  private
  def set_params
    
  end
end
