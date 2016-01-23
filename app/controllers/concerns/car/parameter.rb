module Car::Parameter
  extend ActiveSupport::Concern

  private

    # Private: Permit car_slug param
    #
    # Return the Hash
    def car_params
      params.permit(:car_slug)
    end
end
