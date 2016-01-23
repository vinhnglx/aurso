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

class CarType < ActiveRecord::Base
  # Constants
  FLEXIBLE_URL = 'http://reuters.com'
  FIXED_URL = 'https://developer.github.com/v3/#http-redirects'
  PRESTIGE_URL = 'http://www.yourlocalguardian.co.uk/sport/rugby/rss/'

  # Validations
  validates :name, :car_type_code, :car_type_slug, :base_price, presence: true

  # Relations
  belongs_to :car

  # Delegations
  delegate :pricing_policy, to: :pricing_policy, prefix: true, allow_nil: true

  # Get pricing_policy from organization
  #
  # Examples
  #
  #   car_type = CarType.first
  #   car_type.pricing_policy
  #   # => "Flexible"
  #
  # Returns one of pricing policies
  def pricing_policy
    car.organization.pricing_policy
  end

  # Display total_price of a car type
  #
  # Examples
  #
  #   car_type = CarType.first
  #   car_type.total_price
  #   # => 239093
  #
  # Returns the Integer
  def total_price
    calculate(pricing_policy)
  end

  private

    # Calculate total price base on policy and base price
    #
    # Examples
    #
    #   calculate('Flexible')
    #   # => 329093
    #
    # Returns the Integer
    def calculate(policy)
      case pricing_policy
      when 'Flexible'
        base_price * (Appearance.new(FLEXIBLE_URL).letter_frequency('a').to_f / 100)
      when 'Fixed'
        base_price + Appearance.new(FIXED_URL).word_frequency('status')
      when 'Prestige'
        base_price + Appearance.new(PRESTIGE_URL).element_frequency('pubDate')
      end
    end
end
