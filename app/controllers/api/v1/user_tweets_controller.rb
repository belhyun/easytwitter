module Api
  module V1
    class UserTweetsController < ApplicationController
      before_action :set_params
      before_action :set_client, only: [:create, :destroy]
      skip_before_filter :verify_authenticity_token
      respond_to :json

      def create
        #if session is exists
        userTweet = UserTweet.save
        render :json => userTweet
      end

      def destroy
        if current_user
        end
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

      def set_client
        if user = current_user
          client = UserTweet.get_client(user[:oauth_token], user[:oauth_token_secret])
        end
      end
    end
  end
end
