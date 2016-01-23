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

require 'rails_helper'

RSpec.describe CarType, type: :model do
  include_context 'appearances'

  context 'attributes' do
    it 'has name' do
      car_type = build(:car_type, name: 'F102')
      expect(car_type).to have_attributes(name: 'F102')
    end

    it 'has car_type_slug' do
      car_type = build(:car_type, car_type_slug: 'F102')
      expect(car_type).to have_attributes(car_type_slug: 'F102')
    end

    it 'has car_type_code' do
      car_type = build(:car_type, car_type_code: 'F102')
      expect(car_type).to have_attributes(car_type_code: 'F102')
    end

    it 'has base_price' do
      car_type = build(:car_type, base_price: 300_000)
      expect(car_type).to have_attributes(base_price: 300_000)
    end
  end

  context 'indexes' do
    it { should have_db_index(:car_id).unique(true) }
  end

  context 'validations' do
    it { should validate_presence_of :name }
    it { should validate_presence_of :car_type_slug }
    it { should validate_presence_of :car_type_code }
    it { should validate_presence_of :base_price }
  end

  context 'relations' do
    it { should belong_to :car }
  end

  context 'delegations' do
    let(:organization) { create(:organization, pricing_policy: 'Flexible') }
    let(:car) { create(:car, organization: organization) }
    let(:car_type) { create(:car_type, car: car) }

    it 'returns the pricing_policy' do
      expect(car_type.pricing_policy).to eq('Flexible')
    end
  end

  context 'total price' do
    let(:org_flex) { create(:organization, pricing_policy: 'Flexible') }
    let(:org_fixed) { create(:organization, pricing_policy: 'Fixed') }
    let(:org_pres) { create(:organization, pricing_policy: 'Prestige') }

    context 'Pricing Logic: Flexible' do
      let(:car) { create(:car, organization: org_flex) }
      let(:car_type) { create(:car_type, car: car, base_price: 100_000) }

      it 'returns total price = base_price * margin' do
        expect(car_type.total_price).to eq 400_000.0
      end
    end

    context 'Pricing Logic: Fixed' do
      let(:car) { create(:car, organization: org_fixed) }
      let(:car_type) { create(:car_type, car: car, base_price: 100_000) }

      it 'returns total price = base_price + margin' do
        expect(car_type.total_price).to eq 100_020
      end
    end

    context 'Pricing Logic: Prestige' do
      let(:car) { create(:car, organization: org_pres) }
      let(:car_type) { create(:car_type, car: car, base_price: 100_000) }

      it 'returns total price = base_price + margin' do
        expect(car_type.total_price).to eq 100_004
      end
    end

  end
end
