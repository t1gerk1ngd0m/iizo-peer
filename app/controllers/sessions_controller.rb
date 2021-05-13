class SessionsController < ApplicationController
  def new

  end

  def create
    # binding.pry
    # user = User.from_omniauth(request.env['omniauth.auth'])
    # if user.save
    #   session[:user_id] = user.id
    # end
    client = HTTPClient.new
    res = client.post(
      slack_auth_url,
      {
        code: params[:code],
        client_id: ENV['SLACK_API_KEY'],
        client_secret: ENV['SLACK_API_SECRET'],
      }
    )
    redirect_to signin_path
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end

  private

  def slack_auth_url
    'https://slack.com/api/oauth.v2.access'
  end
end
