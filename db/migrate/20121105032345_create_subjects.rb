class CreateSubjects < ActiveRecord::Migration
  def change
    create_table :subjects do |t|
      t.string :title
      t.boolean :iit_major
      t.text :notes

      t.timestamps
    end
  end
end
