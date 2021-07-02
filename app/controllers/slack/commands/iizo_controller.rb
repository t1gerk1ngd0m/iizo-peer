class Slack::Commands::IizoController < Slack::BaseController
  def list
    user = User.find_by(slack_id: iizo_params[:user_id])
    iizo_list = []
    received_iizo_count = 0
    if user.present?
      iizo_list = user.received_iizos.includes(:to_user).order(created_at: :desc)
      received_iizo_count = iizo_list.count + user.iizo_stamps_count
    end
    init_msg = "<@#{user.slack_name}> 今までもらったいいぞは#{received_iizo_count}件やで！\n"
    reply_message = iizo_list.each_with_index.reduce(init_msg) do |result, (iizo, index)|
      result += "#{iizo.created_at.strftime('%Y/%m/%d')} #{iizo.message} by #{iizo.from_user.slack_name}\n"
    end

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

  def create
    team = Team.find_by(slack_id: iizo_params[:team_id])
    target_user_params = iizo_params[:text].match(/<@(.*?)>/)[1].split('|')
    target_user = team.find_or_create_user_by_slack_id(target_user_params[0], slack_name: target_user_params[1])
    posted_user = team.find_or_create_user_by_slack_id(iizo_params[:user_id], slack_name: iizo_params[:user_name])

    iizo_message = iizo_params[:text].match(/>(.*?\Z)/)[1]
    posted_user.send_iizo_to(target_user, message: iizo_message, response_url: iizo_params[:response_url])

    reply_message = "<@#{target_user.slack_name}>\n<@#{posted_user.slack_name}> からいいぞが送られてきたよ！\n#{iizo_message}"
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
