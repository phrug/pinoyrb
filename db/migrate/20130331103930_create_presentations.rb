class CreatePresentations < ActiveRecord::Migration
  def change
    create_table :presentations do |t|
      t.string :name
      t.string :slug
      t.text :description
      t.references :event
      t.string :youtube
      t.string :slideshare
      t.string :speakerdeck

      t.timestamps
    end
    add_index :presentations, :event_id
    add_index :presentations, :slug, :unique => true
  end
end
