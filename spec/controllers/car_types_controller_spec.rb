require 'rails_helper'

RSpec.describe CarTypesController, type: :controller do
  context 'index' do
    describe 'car slug invalid' do
      it 'returns not_found status'
    end

    describe 'car slug valid' do
      it 'returns list of cars types' do
        get :index, car_id: 'hello-world'
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
        post :create, car_id: 'hello-world'
        expect(response.status).to eq 201
      end
    end
  end
end
