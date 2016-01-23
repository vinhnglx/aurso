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
      car = build(:car, car_slug: 'f015')
      expect(car).to have_attributes(car_slug: 'f015')
    end
  end

  context 'indexes' do
    it { should have_db_index(:organization_id).unique(true) }
  end

  context 'validations' do
    it { should validate_presence_of :name }
    it { should validate_presence_of :car_slug }
  end

  context 'relations' do
    it { should belong_to(:organization) }
    it { should have_many(:car_types) }
  end

  context 'delegations' do
    let(:organization) { create(:organization, pricing_policy: 'Flexible') }
    let(:car) { create(:car, organization: organization) }

    it 'returns the pricing_policy' do
      expect(car.pricing_policy).to eq('Flexible')
    end
  end
end
