class CreateSponsors < ActiveRecord::Migration
  def change
    create_table :sponsors do |t|
      t.references :event
      t.references :entity
      t.string :role

      t.timestamps
    end
    add_index :sponsors, :event_id
    add_index :sponsors, :entity_id
  end
end
