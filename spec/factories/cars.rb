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

FactoryGirl.define do
  factory :car do
    name 'BMW'

    organization
  end
end
