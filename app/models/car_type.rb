# == Schema Information
#
# Table name: car_types
#
#  id            :integer          not null, primary key
#  name          :string
#  car_type_slug :string
#  car_type_code :string
#  base_price    :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  car_id        :integer
#

class CarType < ActiveRecord::Base
  # Validations
  validates :name, :car_type_code, :car_type_slug, :base_price, presence: true

  # Relations
  belongs_to :car
end
