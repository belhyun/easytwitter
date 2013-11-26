class User
  include Mongoid::Document
  field :uuid, type: String
  field :name, type: String
  field :screen_name, type: String
  field :image, type:String
  has_many :tweets, autosave: true

  def self.save(timeline)
    if !User.where(uuid: timeline.user.id).exists?
      user = User.new(:uuid => timeline.user.id, 
                      :name => timeline.user.name, 
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
    end
  end
end
