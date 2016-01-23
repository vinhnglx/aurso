# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

ApiToken.create!

organization = Organization.create!(name: 'AURO', public_name: 'AURO', org_type: 'Show room', pricing_policy: 'Flexible')
car = Car.create!(name: 'BMW', car_slug: 'bmw', organization: organization)
10.times do |i|
  base_price = Random.rand(100_000..300_000)
  CarType.create!(name: "Serie #{i}", car_type_slug: "slug-#{i}", car_type_code: "code-#{i}", car: car, base_price: base_price)
end
