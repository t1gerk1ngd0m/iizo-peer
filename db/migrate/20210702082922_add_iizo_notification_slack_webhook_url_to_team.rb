class AddIizoNotificationSlackWebhookUrlToTeam < ActiveRecord::Migration[6.1]
  def change
    add_column :teams, :iizo_notification_slack_webhook_url, :string, null: false, default: '', comment: 'いいぞ通知用Slack Webhook URL'
  end
end
