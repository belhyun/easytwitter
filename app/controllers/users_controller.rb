class UsersController < ApplicationController
  before_action :set_params
  layout "gon", :only => :show
  def show
    if !current_user
      gon.tweet_user = @user = Twitter.user(params[:id].to_i)
    else
      gon.tweet_user = @user = @client.user(params[:id].to_i)
    end
  end

  def follow
  end

  private
  def set_params
  end
end
