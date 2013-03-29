class CreateAffiliations < ActiveRecord::Migration
  def change
    create_table :affiliations do |t|
      t.references :entity
      t.references :user
      t.string :position
      t.boolean :current

      t.timestamps
    end
    add_index :affiliations, :entity_id
    add_index :affiliations, :user_id
  end
end
