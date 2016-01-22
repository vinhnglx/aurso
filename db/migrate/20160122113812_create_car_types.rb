class CreateCarTypes < ActiveRecord::Migration
  def change
    create_table :car_types do |t|
      t.string :name
      t.string :car_type_slug
      t.string :car_type_code
      t.integer :base_price

      t.timestamps null: false
    end
  end
end
