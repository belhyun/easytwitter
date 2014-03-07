class Tweet
  class << self
    def set_user_desc=(user_desc)
      @user_desc  = user_desc
    end
  end
  include Mongoid::Document
  field :uuid, type: String
  field :text, type: String
  field :created_at, type: DateTime
  field :retweet_count, type: Integer
  field :favorite_count, type: Integer
  field :score, type: Integer

  scope :mifd_rank, order_by("score DESC")
  has_many :user_tweets, autosave: true
  belongs_to :category
  belongs_to :user
  scope :tweet_uuid, ->(tweet_uuid){where(tweet_uuid: tweet_uuid)}
  scope :today, where(:created_at.gte => Date.today-1)
  def self.tweet_with_user(tweets)
    tweets.each_with_object([]){|tweet, tweet_with_user|
      tweet.attributes.delete("user_id")
      tweet.user.attributes.delete("_id")
      tweet.attributes[:user] = tweet.user.attributes
      tweet[:user_tweets] = UserTweet.where(user_desc: @user_desc,tweet_id: tweet.id) 
      tweet[:is_retweet] = is_already_request(tweet, 'R')
      tweet[:is_favorite] = is_already_request(tweet, 'F')
      tweet.attributes.delete("_id")
      tweet_with_user <<  tweet.attributes
    }
  end

  def self.people
    tweets = Tweet.tweet_with_user(Tweet.includes(:user).today.asc(:name))
  end

  def self.recent
    tweets = Tweet.tweet_with_user(Tweet.includes(:user).today.desc(:created_at))
  end

  def self.rank
    tweets = Tweet.tweet_with_user(Tweet.includes(:user).mifd_rank.today)
  end

  def self.is_already_request(tweet, type)
    tweet[:user_tweets].to_a.map{|user_tweet| user_tweet[:type].eql? type}.include?(true)
  end

  def self.create_tweet
    APP_CONFIG['tweet_user'].each_with_index do |(category, tweet_users), idx|
      category = Category.find_or_create_by(name: category.to_s, id: idx+1)
      tweet_users.each do |tweet_user|
        begin
          Twitter.user_timeline(tweet_user, :count => 10).each do |timeline|
            if timeline.in_reply_to_status_id.nil?
              user = User.save(timeline)
              p timeline.created_at
              tweet = Tweet.new(
                  :created_at => timeline.created_at,
                  :text => timeline.text,
                  :retweet_count => timeline.retweet_count,
                  :favorite_count => timeline.favorite_count,
                  :score => timeline.retweet_count+timeline.favorite_count,
                  :uuid => timeline.id)
              if !Tweet.where(uuid: timeline.id).exists?
                tweet.save
                user.tweets.push(tweet)
                category.tweets.push(tweet)
              else
                Tweet.where(uuid: timeline.id).update(score: timeline.retweet_count+timeline.favorite_count)
              end
              user.save
            end#endof if
          end#endof do
        rescue Twitter::Error::TooManyRequests => error
          sleep error.rate_limit.reset_in
          retry
        end#end of begin
      end
    end
  end
end
