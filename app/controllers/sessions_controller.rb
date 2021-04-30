class SessionsController < ApplicationController
  def new

  end

  def create
    user = User.from_omniauth(request.env['omniauth.auth'])
    if user.save
      session[:user_id] = user.id
    end
    redirect_to root_path
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end
end
