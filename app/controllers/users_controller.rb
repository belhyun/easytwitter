class UsersController < ApplicationController
  before_action :set_params
  layout "gon"
  def show
    gon.tweet_user = @user = Twitter.user(params[:id].to_i)
  end

  private
  def set_params
  end
end
