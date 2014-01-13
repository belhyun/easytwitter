class TweetsController < ApplicationController
  def index
    hash = Tweet.rank(params[:page], if session[:user] then  session[:user][:screen_name] else "" end)
    @tweets = Kaminari.paginate_array(hash[:tweets]).page(params[:page]).per(10)
    gon.tweets = @tweets
  end
end
