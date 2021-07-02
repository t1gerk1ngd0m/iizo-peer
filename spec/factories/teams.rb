# == Schema Information
#
# Table name: teams
#
#  id                                                                 :uuid             not null, primary key
#  iizo_notification_slack_webhook_url(いいぞ通知用Slack Webhook URL) :string           default(""), not null
#  slack_access_token(アプリインストール時に発行されたトークン)       :string           default(""), not null
#  slack_domain(Slackチームドメイン)                                  :string           default(""), not null
#  slack_name(Slackチーム名)                                          :string           default(""), not null
#  created_at                                                         :datetime         not null
#  updated_at                                                         :datetime         not null
#  slack_id(SlackチームID)                                            :string           default(""), not null
#
FactoryBot.define do
  factory :team do
    slack_id { "MyString" }
    slack_name { "MyString" }
    slack_domain { "MyString" }
    slack_access_token { "MyString" }
  end
end
