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

RSpec.describe CarTypesController, type: :controller do
  context 'index' do
    describe 'car slug invalid' do
      it 'returns not_found status'
    end

    describe 'car slug valid' do
      it 'returns list of cars types' do
        get :index, car_slug: 'hello-world'
        expect(response.status).to eq 200
      end
    end
  end

  context 'create' do
    describe 'car slug invalid' do
      it 'returns not_found status'
    end

    context 'car slug valid' do
      it 'returns new car type' do
        post :create, car_slug: 'hello-world', car_type_slug: 'hello-world'
        expect(response.status).to eq 201
      end
    end
  end
end
