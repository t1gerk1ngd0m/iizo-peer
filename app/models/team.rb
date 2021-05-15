# == Schema Information
#
# Table name: teams
#
#  id                                                           :uuid             not null, primary key
#  slack_access_token(アプリインストール時に発行されたトークン) :string           default(""), not null
#  slack_domain(Slackチームドメイン)                            :string           default(""), not null
#  slack_name(Slackチーム名)                                    :string           default(""), not null
#  created_at                                                   :datetime         not null
#  updated_at                                                   :datetime         not null
#  slack_id(SlackチームID)                                      :string           default(""), not null
#
class Team < ApplicationRecord
  has_many :users, dependent: :destroy

  validates :slack_id
  validates :slack_name
end
