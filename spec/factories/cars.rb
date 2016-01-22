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

FactoryGirl.define do
  factory :car do
    name 'BMW'
    car_slug 'serie_3'

    organization
  end
end
