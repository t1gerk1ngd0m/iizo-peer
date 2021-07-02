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
class Team < ApplicationRecord
  has_many :users, dependent: :destroy

  validates :slack_id, presence: true, uniqueness: true
  validates :slack_name, presence: true

  def self.find_or_create_by_slack_id(slack_id, **args)
    team = self.find_or_create_by(slack_id: slack_id)
    team.update(args)
  end

  def find_or_create_user_by_slack_id(user_slack_id, **args)
    user = users.find_or_create_by(slack_id: user_slack_id)
    user.update(args)
    user
  end
end
