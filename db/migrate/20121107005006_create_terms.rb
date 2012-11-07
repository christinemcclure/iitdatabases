class CreateTerms < ActiveRecord::Migration
  def change
    create_table :terms do |t|
      t.string :item
      t.boolean :iit_subject
      t.text :notes

      t.timestamps
    end
  end
end
