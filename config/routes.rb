Rails.application.routes.draw do
  resources :cars do
    resources :car_types, only: [:create, :index]
    post 'car_types_prices/:car_type_slug' => 'car_types#create'
  end
end
