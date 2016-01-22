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

require 'rails_helper'

RSpec.describe Car, type: :model do
  context 'attributes' do
    it 'has name' do
      car = build(:car, name: 'Mercedes')
      expect(car).to have_attributes(name: 'Mercedes')
    end

    it 'has car_slug' do
      car = build(:car, car_slug: 'F015')
      expect(car).to have_attributes(car_slug: 'F015')
    end
  end

  context 'validations' do
    it { should validate_presence_of :name }
    it { should validate_presence_of :car_slug }
  end

  context 'relations' do
    it { should belong_to(:organization) }
    it { should have_many(:car_types) }
  end
end
