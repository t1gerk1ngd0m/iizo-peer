class SessionsController < ApplicationController
  def new

  end

  def create
    client = HTTPClient.new
    res = client.post(
      slack_auth_url,
      {
        code: params[:code],
        client_id: ENV['SLACK_API_KEY'],
        client_secret: ENV['SLACK_API_SECRET'],
      }
    )
    res_body = JSON.parse(res.body)
    team_item = res_body['team']

    Team.find_or_create_by_slack_id(
      team_item['id'],
      slack_name: team_item['name'],
      slack_access_token: res_body['access_token']
    )

    redirect_to signin_path
  end

  private

  def slack_auth_url
    'https://slack.com/api/oauth.v2.access'
  end
end
