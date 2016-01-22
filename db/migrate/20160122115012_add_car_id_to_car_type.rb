class AddCarIdToCarType < ActiveRecord::Migration
  def change
    add_column :car_types, :car_id, :integer
  end
end
