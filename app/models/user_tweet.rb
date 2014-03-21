class UserTweet
  class << self
    attr_accessor :params
  end
  include Mongoid::Document
  include JsonHelper

  field :user_desc, type:String
  field :type, type:String
  field :tweet_uuid,  type:String
  belongs_to :tweet
  scope :tweet_uuid_exists, ->(tweet_uuid){ where(tweet_uuid: tweet_uuid) }
  scope :type_exists, ->(type){ where(type: type) }
  scope :user_desc_exists, ->(user_desc){ where(user_desc: user_desc) }
  
=begin
  def self.params=(params)
   @params = params 
  end

  def self.params
    @params
  end
=end

  def self.criteria
    UserTweet.where(user_desc: params[:user_desc], 
                    type: params[:type], 
                    tweet_uuid: params[:tweet_uuid])
  end

  def self.save
    if !criteria.exists?
      tweet = Tweet.find_by(uuid: params[:tweet_uuid])
      tweet.user_tweets.create(Hash[params])
      JsonHelper.res_success
    else
      JsonHelper.res_fail('already requested')
    end
  end

  def self.delete
    if criteria.exists?
       criteria.delete
      JsonHelper.res_success
    else
      JsonHelper.res_fail('resource not exists')
    end
  end
end
