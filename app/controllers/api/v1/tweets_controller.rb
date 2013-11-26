module Api
  module V1
    class TweetsController < ApplicationController
      respond_to :json
      def index
        @result = Array.new
        hash = Hash.new
        Rails.application.config.mifd_designers.each do |designer|
          Twitter.user_timeline(designer, :count => 10).each do |timeline|
            @timeline
            if timeline.in_reply_to_status_id.nil?
              hash[:created_at] = timeline.created_at
              hash[:text] = timeline.text
              hash[:retweet_count] = timeline.retweet_count
              hash[:favorite_count] = timeline.favorite_count
              hash[:tweet_id] = timeline.id
              hash[:user] = Hash.new
              hash[:user][:user_id] = timeline.user.id
              hash[:user][:user_name] = timeline.user.name
              hash[:user][:screen_name] = timeline.user.screen_name
              hash[:user][:image] = timeline.user.profile_image_url;
              User.save(timeline)
              @result << hash
              hash = Hash.new
            end
          end
        end
        render :json => @result.to_json
      end
      def rank
        tweets = Kaminari.paginate_array(Tweet.rank).page(params[:page]).per(10)
        render :json => tweets.to_json
      end
    end
  end
end
