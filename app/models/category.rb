class Category
  class << self
    def set_id=(id)
      @id = id
    end
  end
  include Mongoid::Document
  field :name, type: String
  has_many :tweets

  def self.people
    Tweet.tweet_with_user(Category.find_by(:id => @id).tweets.includes(:user).today.desc(:name))
  end

  def self.recent
    Tweet.tweet_with_user(Category.find_by(:id => @id).tweets.includes(:user).today.desc(:created_at))
  end

  def self.rank
    Tweet.tweet_with_user(Category.find_by(:id => @id).tweets.includes(:user).today.desc(:score))
  end
end
