class TweetsController < ApplicationController
  before_action :set_user_desc
  before_action :client
  def test
    @client = Twitter.status(params[:id])
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

  def show
    begin
      hash = {:tweet => @tweet = @client.status(params[:id]),
              :user => current_user}
      respond_to do |format|
        format.html
        format.json {render json: hash.to_json }
      end
    rescue Mongoid::Errors::DocumentNotFound 
      render :status => 500, :text => 'Not Exists'
    end
  end

  private
  def set_user_desc
    Tweet.set_user_desc = if session[:user] then  session[:user][:screen_name] else "" end
  end

  def client
    Tweet.client = @client
  end

end
