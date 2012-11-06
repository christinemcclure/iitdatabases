class CreateDatabasesSubjectsJoinTable < ActiveRecord::Migration
  def up
    create_table :databases_subjects, :id => false do |t|
      t.references :database, :subject
    end
  end

  def down
  end
end
