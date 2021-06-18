# == Schema Information
#
# Table name: iizo_stamps
#
#  id               :bigint           not null, primary key
#  slack_event_type :integer          default(0), not null
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  from_user_id     :uuid             not null
#  slack_event_id   :string           default(""), not null
#  to_user_id       :uuid             not null
#
# Indexes
#
#  index_iizo_stamps_on_from_user_id  (from_user_id)
#  index_iizo_stamps_on_to_user_id    (to_user_id)
#
# Foreign Keys
#
#  fk_rails_...  (from_user_id => users.id)
#  fk_rails_...  (to_user_id => users.id)
#
class IizoStamp < ApplicationRecord
  belongs_to :to_user, class_name: "User"
  belongs_to :from_user, class_name: "User"

  validates :slack_event_type, presence: true
  validates :slack_event_id, presence: true

  enum slack_event_type: { reaction_added: 0, reaction_removed: 1 }
end
