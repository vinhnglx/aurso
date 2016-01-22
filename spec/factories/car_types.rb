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

FactoryGirl.define do
  factory :car_type do
    name '330i'
    car_type_slug '330i'
    car_type_code '330i'
    base_price 250_000

    car
  end
end
