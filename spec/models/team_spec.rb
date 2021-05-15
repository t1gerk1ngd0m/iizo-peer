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
require 'rails_helper'

RSpec.describe Team, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
