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
class User < ApplicationRecord
  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_initialize.tap do |user|
      user.name = auth.info.name
      user.email = auth.info.email
      user.token = auth.credentials.token
    end
  end
end
