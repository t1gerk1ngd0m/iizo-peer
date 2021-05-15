# == Schema Information
#
# Table name: iizos
#
#  id           :uuid             not null, primary key
#  message      :text
#  response_url :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  from_user_id :uuid             not null
#  to_user_id   :uuid             not null
#
# Indexes
#
#  index_iizos_on_from_user_id  (from_user_id)
#  index_iizos_on_to_user_id    (to_user_id)
#
# Foreign Keys
#
#  fk_rails_...  (from_user_id => users.id)
#  fk_rails_...  (to_user_id => users.id)
#
FactoryBot.define do
  factory :iizo do
    to_user { nil }
    from_user { nil }
    message { "MyText" }
    response_url { "MyString" }
  end
end
