class CreateCars < ActiveRecord::Migration
  def change
    create_table :cars do |t|
      t.string :name
      t.string :slug, unique: true

      t.timestamps null: false
    end
  end
end
