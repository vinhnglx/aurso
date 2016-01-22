class AddOrganizationIdToCar < ActiveRecord::Migration
  def change
    add_column :cars, :organization_id, :integer
  end
end
