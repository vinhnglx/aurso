# == Schema Information
#
# Table name: cars
#
#  id              :integer          not null, primary key
#  name            :string
#  car_slug        :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  organization_id :integer
#

class Car < ActiveRecord::Base
  # Validations
  validates :name, :car_slug, presence: true

  # Relations
  belongs_to :organization
  has_many :car_types

  # Delegations
  delegate :pricing_policy, to: :organization
end
