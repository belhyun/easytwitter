class UserTweet
  include Mongoid::Document
  field :user_desc, type:String
  field :type, type:String
  field :tweet_id,  type:String
  belongs_to :tweet

  def self.save(params)
    #hash = Hash.new
    tweet = Tweet.find_by(uuid: params[:tweet_id])
    tweet.user_tweets.create(Hash[params])
  end
end

