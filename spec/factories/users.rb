# == Schema Information
#
# Table name: users
#
#  id                          :uuid             not null, primary key
#  slack_name(Slackユーザー名) :string           default(""), not null
#  created_at                  :datetime         not null
#  updated_at                  :datetime         not null
#  slack_id(SlackユーザーID)   :string           default(""), not null
#  team_id                     :uuid             not null
#
# Indexes
#
#  index_users_on_team_id  (team_id)
#
# Foreign Keys
#
#  fk_rails_...  (team_id => teams.id)
#
FactoryBot.define do
  factory :user do
    slack_id { "MyString" }
    slack_name { "MyString" }
    team { nil }
  end
end
