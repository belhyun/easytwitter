class SessionsController < ApplicationController
  def create
    user = User.from_omniauth(env['omniauth.auth'])
    session[:uuid] = user[:uuid]
    redirect_to root_url, notice: "Signed in"
  end
end
