class AddDbIndexes < ActiveRecord::Migration
  def change
    add_index :car_types, :car_id, unique: true
    add_index :cars, :organization_id, unique: true
  end
end
