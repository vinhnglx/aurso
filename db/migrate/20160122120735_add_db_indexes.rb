class AddDbIndexes < ActiveRecord::Migration
  def change
    add_index :car_types, :car_id
    add_index :cars, :organization_id
  end
end
