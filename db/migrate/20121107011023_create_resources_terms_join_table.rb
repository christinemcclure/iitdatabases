class CreateResourcesTermsJoinTable < ActiveRecord::Migration
  def up
    create_table :resources_terms, :id => false do |t|
      t.integer :resource_id
      t.integer :term_id
    end
  end

  def down
  end
end
