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
  FLEXIBLE_URL = 'http://reuters.com'.freeze
  FIXED_URL = 'https://developer.github.com/v3/#http-redirects'.freeze
  PRESTIGE_URL = 'http://www.yourlocalguardian.co.uk/sport/rugby/rss/'.freeze

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
    car.pricing_policy
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
    calculate(pricing_policy).round(2)
  end

  private

    # Private: Calculate total price base on policy and base price
    #
    # policy  - pricing policy
    #
    # Examples
    #
    #   calculate('Flexible')
    #   # => 329093
    #
    # Returns the Integer
    def calculate(policy)
      case policy
      when 'Flexible'
        base_price * Rails.cache.fetch(:listings) { margin(policy) }
      when 'Fixed'
        base_price + Rails.cache.fetch(:listings) { margin(policy) }
      when 'Prestige'
        base_price + Rails.cache.fetch(:listings) { margin(policy) }
      end
    end

    # Private: Calculate margin
    #
    # policy  - pricing policy
    #
    # Examples
    #
    #   margin('Flexible')
    #   # => 9
    #
    # Returns the Integer
    def margin(policy)
      return (Appearance.new(FLEXIBLE_URL).letter_frequency('a').to_f / 100) if policy == 'Flexible'
      return Appearance.new(FIXED_URL).word_frequency('status') if policy == 'Fixed'
      return Appearance.new(PRESTIGE_URL).element_frequency('pubDate') if policy == 'Prestige'
    end
end
