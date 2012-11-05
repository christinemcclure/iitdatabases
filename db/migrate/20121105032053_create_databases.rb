class CreateDatabases < ActiveRecord::Migration
  def change
    create_table :databases do |t|
      t.string :title
      t.string :string
      t.string :alt_titles
      t.text :description
      t.boolean :restricted
      t.boolean :active
      t.string :access_url
      t.boolean :popular
      t.text :notes

      t.timestamps
    end
  end
end
