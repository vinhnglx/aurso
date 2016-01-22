# == Schema Information
#
# Table name: cars
#
#  id              :integer          not null, primary key
#  name            :string
#  slug            :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  organization_id :integer
#

class Car < ActiveRecord::Base
  # Validations
  validates :name, presence: true

  # Relations
  belongs_to :organization
  has_many :car_types

  # FriendlyId
  extend FriendlyId
  friendly_id :name, use: :slugged
end
