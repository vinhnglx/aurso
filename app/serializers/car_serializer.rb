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

class CarSerializer < ActiveModel::Serializer
  attributes :name, :car_types

  has_many :car_types
end
