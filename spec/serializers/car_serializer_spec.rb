require 'rails_helper'

RSpec.describe CarSerializer, type: :serializer do
  context 'Car Serializer' do
    let!(:organization) { create(:organization, pricing_policy: 'Flexible') }
    let!(:car) { create(:car, organization: organization) }
    let!(:car_type) { create(:car_type, car: car) }

    let!(:serializer) { CarSerializer.new(car) }

    it 'has name' do
      expect(serializer).to have_attributes(name: car.name)
    end

    it 'has pricing_policy' do
      expect(serializer).to have_attributes(pricing_policy: organization.pricing_policy)
    end

    it 'has car_types' do
      expect(serializer.car_types).to eq [car_type]
    end
  end
end
