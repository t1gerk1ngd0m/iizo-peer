class IizoController < ApplicationController
  protect_from_forgery

  def create
    target_user = iizo_params[:text].match(/<@(.*?)>/)[1].split('|')
    posted_user = [iizo_params[:user_id], iizo_params[:user_name]]

    iizo_message = iizo_params[:text].match(/>(.*?\Z)/)[1]
    reply_message = "<@#{target_user[1]}>\n<@#{posted_user[1]}>からいいぞが送られてきたよ！\n#{iizo_message}"

    request_body = {
      text: reply_message,
      response_type: "in_channel"
    }
    client = HTTPClient.new
    client.post(
      iizo_params[:response_url],
      request_body.to_json,
    )
    head :ok
  end

  private

  def iizo_params
    params.permit(
      :token,
      :team_id,
      :team_domain,
      :channel_id,
      :channel_name,
      :user_id,
      :user_name,
      :command,
      :text,
      :api_app_id,
      :is_enterprise_install,
      :response_url,
      :trigger_id,
    )
  end
end
