class SessionsController < ApplicationController
  def create
    session[:user] = User.from_omniauth(env['omniauth.auth'])
    redirect_to :controller=> 'tweets', :action => 'index' ,:user_desc => session[:user][:screen_name]
  end
end
