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

class Organization < ActiveRecord::Base
  TYPES = ['Show room', 'Service', 'Dealer']
  PRICING_POLICIES = ['Flexible', 'Fixed', 'Prestige']

  # Validations
  validates :name, :public_name, presence: true
  validates :type, inclusion: { in: TYPES, message: 'Type must be Show room, Service or Dealer.' }
  validates :pricing_policy, inclusion: { in: PRICING_POLICIES, message: 'Pricing policy must be Flexible, Fixed or Prestige.' }
end
