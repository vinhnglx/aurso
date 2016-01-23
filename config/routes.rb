Rails.application.routes.draw do
  get 'cars/:car_slug/car_types' => 'car_types#index'
  post 'cars/:car_slug/car_types_prices/:car_type_slug' => 'car_types#create'
end
