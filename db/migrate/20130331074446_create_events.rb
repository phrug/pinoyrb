class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :event_type
      t.string :name
      t.string :slug
      t.text :description
      t.references :venue
      t.datetime :start_at
      t.datetime :end_at

      t.timestamps
    end
    add_index :events, :venue_id
    add_index :events, :slug, :unique => true
  end
end
