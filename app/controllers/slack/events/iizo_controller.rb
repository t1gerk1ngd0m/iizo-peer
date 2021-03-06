class Slack::Events::IizoController < Slack::BaseController
  def create
    render json: params[:challenge].to_json and return unless iizo_params[:team_id]
    head :ok and return unless iizo?

    team = Team.find_by(slack_id: iizo_params[:team_id])
    target_user = team.find_or_create_user_by_slack_id(iizo_params[:event][:item_user])
    posted_user = team.find_or_create_user_by_slack_id(iizo_params[:event][:user])

    posted_user.toggle_iizo_stamp_on(
      target_user,
      slack_event_type: iizo_params[:event][:type],
      slack_event_id: iizo_params[:event_id]
    )

    if iizo_params[:event][:type] == 'reaction_added'
      reply_message = "<@#{target_user.slack_name}>\n<@#{posted_user.slack_name}> がいいぞしてくれたよ！"
      request_body = {
        text: reply_message,
        response_type: "in_channel"
      }
      client = HTTPClient.new
      client.post(
        team.iizo_notification_slack_webhook_url,
        request_body.to_json,
      )
    end

    render json: params[:challenge].to_json
  end

  private

  def iizo_params
    params.permit(
      :token,
      :team_id,
      :api_app_id,
      :type,
      :event_id,
      :event_time,
      event: [
        :type,
        :user,
        :reaction,
        :item_user,
        :event_ts,
        item: [
          :type,
          :channel,
          :ts
        ],
      ]
    )
  end

  def iizo?
    iizo_params[:event][:reaction] == "iizo"
  end
end
