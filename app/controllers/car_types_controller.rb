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

class CarTypesController < ApplicationController
  include ::Car::Finder
  include ::Car::Parameter

  def index
    cars = load_car(car_params[:car_slug])

    return respond_404 if cars.blank?

    render json: {
      cars: ActiveModel::ArraySerializer.new(cars, each_serializer: ::CarSerializer)
    }
  end

  def create
    head :created
  end
end
