class TweetsController < ApplicationController
  def index
    hash = Tweet.rank(params[:page], params[:user_desc])
    @tweets = Kaminari.paginate_array(hash[:tweets]).page(params[:page]).per(10)
    gon.tweets = @tweets
  end
end
