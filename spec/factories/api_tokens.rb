# == Schema Information
#
# Table name: api_tokens
#
#  id           :integer          not null, primary key
#  access_token :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

FactoryGirl.define do
  factory :api_token do
    access_token SecureRandom.hex
  end
end
