class TweetsController < ApplicationController
  before_action :set_user_desc
  def index
    gon.tweets = @tweets = Kaminari.paginate_array(Tweet.rank).page(params[:page]).per(10)
    gon.type = 1
  end

  def recent
    @tweets = Kaminari.paginate_array(Tweet.recent).page(params[:page]).per(10)
    gon.type = 2
  end

  def people
    @tweets = Kaminari.paginate_array(Tweet.people).page(params[:page]).per(10)
    gon.type = 3
  end

  private
  def set_user_desc
    Tweet.set_user_desc = if session[:user] then  session[:user][:screen_name] else "" end
  end
end
