class RemoveStringFromDatabases < ActiveRecord::Migration
  def up
    remove_column :databases, :string
  end

  def down
    add_column :databases, :string, :string
  end
end
