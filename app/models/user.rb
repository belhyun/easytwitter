class User
  include Mongoid::Document
  field :uuid, type: String
  field :name, type: String
  field :screen_name, type: String
  field :image, type:String
  field :provider, type:String
  has_many :tweets, autosave: true
  scope :exists, ->(uuid){where(uuid: uuid)}
 
  def self.save(timeline)
    if !User.where(uuid: timeline.user.id).exists?
      user = User.new(:uuid => timeline.user.id, 
                      :name => timeline.user.name, 
                      :image => timeline.user.profile_image_url,
                      :screen_name => timeline.user.screen_name)
    else
      user = User.find_by(uuid: timeline.user.id)
    end

    if !Tweet.where(uuid: timeline.id).exists?
      user.tweets.build(:created_at => timeline.created_at,
                        :text => timeline.text,
                        :retweet_count => timeline.retweet_count,
                        :favorite_count => timeline.favorite_count,
                        :score => timeline.retweet_count+timeline.favorite_count,
                        :uuid => timeline.id)
      user.save
    else
      Tweet.where(uuid: timeline.id).update(score: timeline.retweet_count+timeline.favorite_count)
    end
  end

  def self.from_omniauth(auth)
    user = User.find_or_create_by({uuid: auth[:uid], name: "@#{auth[:info][:name]}", image: auth[:info][:image], 
    screen_name: auth[:info][:nickname]})
  end
end
