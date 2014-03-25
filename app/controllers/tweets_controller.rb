class TweetsController < ApplicationController
  before_action :set_user_desc
  def test
    render :layout => false
  end

  def index
    gon.tweets = @tweets = Kaminari.paginate_array(Tweet.rank).page(params[:page]).per(10)
    gon.type = 1
  end

  def recent
    gon.tweets = @tweets = Kaminari.paginate_array(Tweet.recent).page(params[:page]).per(10)
    gon.type = 2
    respond_to do |format|
      format.html
      format.json {render json: @tweets.to_json }
    end
  end

  def people
    gon.tweets = @tweets = Kaminari.paginate_array(Tweet.people).page(params[:page]).per(10)
    gon.type = 3
  end

  private
  def set_user_desc
    Tweet.set_user_desc = if session[:user] then  session[:user][:screen_name] else "" end
  end
end
