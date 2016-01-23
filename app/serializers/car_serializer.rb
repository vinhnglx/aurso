class CarSerializer < ActiveModel::Serializer
  attributes :name, :car_types

  has_many :car_types
end
