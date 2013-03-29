class CreateEntities < ActiveRecord::Migration
  def change
    create_table :entities do |t|
      t.string :entity_type
      t.string :name
      t.string :slug
      t.text :description
      t.references :venue
      t.boolean :recruiting
      t.boolean :display

      t.timestamps
    end
    add_index :entities, :venue_id
    add_index :entities, :slug, :unique => true
  end
end
