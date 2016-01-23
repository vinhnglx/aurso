module Car::Finder
  extend ActiveSupport::Concern

  # Find cars from car slug
  #
  # car_slug  - car slug
  #
  # Examples
  #
  #   load_car(car_slug)
  #   # => Cars
  #
  # Return Array of cars
  def load_car(car_slug)
    Car.where(car_slug: car_slug)
  end
end
