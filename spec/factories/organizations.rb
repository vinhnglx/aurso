# == Schema Information
#
# Table name: organizations
#
#  id             :integer          not null, primary key
#  name           :string
#  public_name    :string
#  type           :string
#  pricing_policy :string
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

FactoryGirl.define do
  factory :organization do
    name 'Astra'
    public_name 'Astra'
    type { ['Show room', 'Service', 'Dealer'].sample }
    pricing_policy { ['Flexible', 'Fixed', 'Prestige'].sample }
  end
end
