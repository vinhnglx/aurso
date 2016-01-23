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
  include_context 'appearances'

  context 'index' do
    describe 'car slug invalid' do
      it 'returns not_found status' do
        get :index, car_slug: 'mercedes-not-found'
        expect(response.status).to eq 404
      end
    end

    describe 'car slug valid' do
      let!(:organization) { create(:organization, pricing_policy: 'Fixed') }
      let!(:car) { create(:car, organization: organization) }
      let!(:car_type) { create(:car_type, car: car, base_price: 200_000) }

      it 'returns list of cars types' do
        get :index, car_slug: car.car_slug
        res = JSON.parse(response.body)

        expect(response.status).to eq 200

        expect(res['cars'][0]['name']).to eq car.name
        expect(res['cars'][0]['car_types'][0]['total_price']).to eq 200_020
      end
    end
  end

  context 'create' do
    context 'with authorization' do
      describe 'car slug invalid' do
        it 'returns not_found status' do
        end
      end

      context 'car slug valid' do
        let!(:api_token) { ApiToken.create! }
        it 'returns new car type' do
          @request.env['HTTP_AUTHORIZATION'] = "Token token=#{api_token.access_token}"

          post :create, car_slug: 'hello-world', car_type_slug: 'hello-world'
          expect(response.status).to eq 201
        end
      end
    end

    context 'without authorization' do
      it 'returns unauthorized status' do
        post :create, car_slug: 'hello-world', car_type_slug: 'hello-world'

        expect(response.status).to eq 401
      end
    end
  end
end
