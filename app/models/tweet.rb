class Tweet
  include Mongoid::Document
  field :uuid, type: String
  field :text, type: String
  field :created_at, type: Date
  field :retweet_count, type: Integer
  field :favorite_count, type: Integer
  field :socre, type: Integer
  scope :retweet, order_by("retweet_count DESC")
  scope :favorite, order_by("favorite_count DESC")
  scope :today, order_by("created_at DESC")
  belongs_to :user

  def self.rank
    Tweet.today.retweet.favorite
  end
end
