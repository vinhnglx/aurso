require 'rails_helper'

RSpec.describe CarTypeSerializer, type: :serializer do
  include_context 'appearances'

  context 'CarType Serializer' do
    let!(:organization) { create(:organization, pricing_policy: 'Flexible') }
    let!(:car) { create(:car, organization: organization) }
    let!(:car_type) { create(:car_type, car: car) }

    let!(:serializer) { CarTypeSerializer.new(car_type) }

    it 'has name' do
      expect(serializer).to have_attributes(name: car_type.name)
    end

    it 'has base_price' do
      expect(serializer).to have_attributes(base_price: car_type.base_price)
    end

    it 'has total_price' do
      expect(serializer).to have_attributes(total_price: car_type.total_price)
    end
  end
end
