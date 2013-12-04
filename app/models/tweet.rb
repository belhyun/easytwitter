class Tweet
  include Mongoid::Document
  field :uuid, type: String
  field :text, type: String
  field :created_at, type: Date
  field :retweet_count, type: Integer
  field :favorite_count, type: Integer
  field :score, type: Integer
  scope :mifd_rank, order_by("score DESC")
  belongs_to :user

  def self.rank(cur_page)
    tweets = Tweet.includes(:user).mifd_rank
    tweets = tweets.each_with_object([]){|tweet, tweet_with_user|
      tweet.attributes.delete("_id")
      tweet.attributes.delete("user_id")
      tweet.user.attributes.delete("_id")
      tweet.attributes[:user] = tweet.user.attributes
      tweet_with_user <<  tweet.attributes
    }
    hash = Hash.new
    hash[:tweets] = tweets
    hash[:total_page] = (tweets.count / 10.0).ceil
    hash[:total_count] = tweets.count
    hash
  end

  def self.create_tweet
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
  end
end
