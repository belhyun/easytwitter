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

  def self.rank
    tweets = Tweet.includes(:user).mifd_rank
    tweets.each_with_object([]){|tweet, tweet_with_user|
      tweet.attributes.delete("_id")
      tweet.attributes.delete("user_id")
      tweet.user.attributes.delete("_id")
      tweet.attributes[:user] = tweet.user.attributes
      tweet_with_user << tweet.attributes
    }
  end
end
