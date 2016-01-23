module Car::Finder
  extend ActiveSupport::Concern

  # Find cars from car slug
  #
  # car_slug  - car slug
  #
  # Examples
  #
  #   load_car('hello')
  #   # => Cars
  #
  # Return Array of cars
  def load_cars(car_slug)
    Car.where(car_slug: car_slug)
  end

  # Find car from car slug
  #
  # car_slug  - car slug
  #
  # Examples
  #
  #   load_car('hello')
  #   # => Car
  #
  # Returns a Car object
  def load_car(car_slug)
    Car.find_by(car_slug: car_slug)
  end
end
