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
  include ActionController::HttpAuthentication::Token::ControllerMethods
  include ::Car::Finder
  include ::Car::Parameter
  before_filter :restrict_access, only: :create

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

  private

    # Private: Require access token before create a car type
    #
    # Returns Boolean
    def restrict_access
      authenticate_or_request_with_http_token do |token, _options|
        ApiToken.exists?(access_token: token)
      end
    end
end
