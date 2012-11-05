class AddVendorIdToDatabases < ActiveRecord::Migration
  def change
    add_column :databases, :vendor_id, :integer
  end
end
