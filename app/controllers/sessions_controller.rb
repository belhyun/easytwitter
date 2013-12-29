class SessionsController < ApplicationController
  def create
    session[:user] = User.from_omniauth(env['omniauth.auth'])
    redirect_to root_url, notice: "Signed in"
  end
end
