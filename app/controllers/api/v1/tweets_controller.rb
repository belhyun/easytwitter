module Api
  module V1
    class TweetsController < ApplicationController
      respond_to :json
      Mongoid.logger.level = Logger::DEBUG
      def index
        @result = Kaminari.paginate_array(Tweet.rank).page(params[:page]).per(10)
        render :json => @result.to_json
      end
      def rank
        @result = Kaminari.paginate_array(Tweet.rank).page(params[:page]).per(10)
        render :json => @result.to_json
      end
    end
  end
end
