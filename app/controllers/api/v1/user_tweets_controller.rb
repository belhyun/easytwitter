module Api
  module V1
    class UserTweetsController < ApplicationController
      before_action :set_params
      skip_before_filter :verify_authenticity_token
      respond_to :json

      def create
        userTweet = UserTweet.save
        if @client && userTweet[:result] == 1
          if params[:type] == 'R'
            @client.retweet(params[:tweet_uuid])
          else
            @client.favorite(params[:tweet_uuid])
          end
        end
        render :json => userTweet
      end

      def destroy
        res = UserTweet.delete
        render :json => res
      end

      private
      def user_tweet_params
        params.require(:user_desc)
        params.require(:tweet_uuid)
        params.require(:type)
      end

      private 
      def set_params
        UserTweet.params = params.except(:action, :controller, :user_tweet)
      end
    end
  end
end
