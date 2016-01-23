# == Schema Information
#
# Table name: organizations
#
#  id             :integer          not null, primary key
#  name           :string
#  public_name    :string
#  org_type       :string
#  pricing_policy :string
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

class Organization < ActiveRecord::Base
  TYPES = ['Show room', 'Service', 'Dealer'].freeze
  PRICING_POLICIES = ['Flexible', 'Fixed', 'Prestige'].freeze

  # Validations
  validates :name, :public_name, presence: true
  validates :org_type, inclusion: { in: TYPES, message: 'Type must be Show room, Service or Dealer.' }
  validates :pricing_policy, inclusion: { in: PRICING_POLICIES, message: 'Pricing policy must be Flexible, Fixed or Prestige.' }

  # Relations
  has_many :cars
end
