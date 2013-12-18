module Api
  module V1
    class UserTweetsController < ApplicationController
      skip_before_filter :verify_authenticity_token
      respond_to :json
      def create
        @userTweet = UserTweet.save(params.except(:action, :controller))
        render :json => @userTweet
      end
      private
      def user_tweet_params
        params.require(:user_desc)
        params.require(:tweet_uuid)
        params.require(:type)
      end
    end
  end
end
