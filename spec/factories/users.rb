# == Schema Information
#
# Table name: users
#
#  id         :bigint           not null, primary key
#  channel    :string           default(""), not null
#  email      :string           default(""), not null
#  name       :string           default(""), not null
#  provider   :string           default(""), not null
#  token      :string           default(""), not null
#  uid        :string           default(""), not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
FactoryBot.define do
  factory :user do
    name { "MyString" }
    email { "MyString" }
    provider { "MyString" }
    uid { "MyString" }
    token { "MyString" }
    channel { "MyString" }
  end
end