class CreateResourcesTermsJoinTable < ActiveRecord::Migration
  def up
    create_table :resources_terms, :id => false do |t|
      t.references :resource, :term
    end
  end

  def down
  end
end
