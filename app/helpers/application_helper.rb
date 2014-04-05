include AutoHtml
module ApplicationHelper
  def get_client(acc_token, acc_token_secret)
    Twitter::Client.new(
      :oauth_token        => acc_token,
      :oauth_token_secret => acc_token_secret
    )
  end
end
