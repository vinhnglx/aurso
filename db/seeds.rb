# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

ApiToken.create!

org_flex = Organization.create!(name: 'AURO', public_name: 'AURO', org_type: 'Show room', pricing_policy: 'Flexible')
org_fixed = Organization.create!(name: 'AURO', public_name: 'AURO', org_type: 'Show room', pricing_policy: 'Fixed')
car_flex = Car.create!(name: 'BMW', car_slug: 'bmw', organization: org_flex)
car_fixed = Car.create!(name: 'BMW', car_slug: 'bmw', organization: org_fixed)

2.times do |i|
  base_price = Random.rand(100_000..300_000)
  CarType.create!(name: "Serie #{i}", car_type_slug: "slug-#{i}", car_type_code: "code-#{i}", car: car_flex, base_price: base_price)
  CarType.create!(name: "Serie #{i}", car_type_slug: "slug-#{i}", car_type_code: "code-#{i}", car: car_fixed, base_price: base_price)
end
