class Trend
  include Mongoid::Document
  field :name, type: String
  field :url, type: String

  def self.create_trends
    if Trend.count > 0
      Trend.all.delete
    end
    Twitter.trends(APP_CONFIG['geo_id']).each{|trend|
      Trend.create(:name => trend.name, :url => trend.url)
    }
  end
end
