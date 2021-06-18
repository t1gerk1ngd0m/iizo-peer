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
require 'rails_helper'

RSpec.describe IizoStamp, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
