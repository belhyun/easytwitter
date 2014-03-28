module TweetsHelper
  def escape_http(text)
    text.gsub(/(https?:\/\/([-\w\.]+)+(:\d+)?(\/([\w\/_\.]*(\?\S+)?)?)?)/){|s|"<a target='_blank' href=#{s}>#{s}</a>"}.html_safe
  end
end
