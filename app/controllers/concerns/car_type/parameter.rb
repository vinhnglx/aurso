module CarType::Parameter
  extend ActiveSupport::Concern

  private

    # Private: Permit car_slug param
    #
    # Return the Hash
    def car_type_params
      params.permit(:car_type_slug, :base_price, :name)
    end
end
