# == Schema Information
#
# Table name: organizations
#
#  id             :integer          not null, primary key
#  name           :string
#  public_name    :string
#  type           :string
#  pricing_policy :string
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

require 'rails_helper'

RSpec.describe Organization, type: :model do
  context 'attributes' do
    it 'has name' do
      organization = build(:organization, name: 'Bullet')
      expect(organization).to have_attributes(name: 'Bullet')
    end

    it 'has public_name' do
      organization = build(:organization, public_name: 'Silver Bullet')
      expect(organization).to have_attributes(public_name: 'Silver Bullet')
    end

    it 'has type' do
      type = ['Show room', 'Service', 'Dealer'].sample

      organization = build(:organization, type: type)
      expect(organization).to have_attributes(type: type)
    end

    it 'has pricing_policy' do
      pricing_policy = ['Flexible', 'Fixed', 'Prestige'].sample

      organization = build(:organization, pricing_policy: pricing_policy)
      expect(organization).to have_attributes(pricing_policy: pricing_policy)
    end
  end

  context 'validations' do
    let(:types) { ['Show room', 'Service', 'Dealer'] }
    let(:pricing_policies) { ['Flexible', 'Fixed', 'Prestige'] }

    it { should validate_presence_of :name }

    it { should validate_presence_of :public_name }

    it do
      should validate_inclusion_of(:type).in_array(types).with_message('Type must be Show room, Service or Dealer.')
    end

    it do
      should validate_inclusion_of(:pricing_policy).in_array(pricing_policies).with_message('Pricing policy must be Flexible, Fixed or Prestige.')
    end
  end

  context 'relations' do
    it { should have_many(:cars) }
  end
end
