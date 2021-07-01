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
class User < ApplicationRecord
  belongs_to :team
  has_many :recieved_iizos, foreign_key: :to_user_id, class_name: "Iizo"
  has_many :send_iizos, foreign_key: :from_user_id, class_name: "Iizo"
  has_many :recieved_iizo_stamps, foreign_key: :to_user_id, class_name: "IizoStamp"
  has_many :send_iizo_stamps, foreign_key: :from_user_id, class_name: "IizoStamp"

  validates :slack_id, presence: true, uniqueness: true
  # validates :slack_name, presence: true

  def send_iizo_to(target, **args)
    send_iizos.create(args.merge(to_user: target))
  end

  def recieve_iizo_from(sender, **args)
    recieved_iizos.create(args.merge(from_user: sender))
  end

  def toggle_iizo_stamp_on(target, **args)
    send_iizo_stamps.create(args.merge(to_user: target))
  end

  def iizo_stamps_count
    recieved_iizo_stamps.reaction_added.count - recieved_iizo_stamps.reaction_removed.count
  end
end
