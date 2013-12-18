class UserTweet
  include Mongoid::Document
  field :user_desc, type:String
  field :type, type:String
  field :tweet_uuid,  type:String
  belongs_to :tweet

  def self.save(params)
    res = Hash.new
    tweet = Tweet.find_by(uuid: params[:tweet_uuid])
    if !UserTweet.where(user_desc: params[:user_desc], 
                        type: params[:type], 
                        tweet_uuid: params[:tweet_uuid]).exists?
      tweet.user_tweets.create(Hash[params])
      self.success
    else
      self.fail('already requested')
    end
  end

  def self.success
    {:result => 1, :msg => 'success'}
  end

  def self.fail(msg)
    {:result => 0, :msg => msg}
  end
end

