class CreateVenues < ActiveRecord::Migration
  def change
    create_table :venues do |t|
      t.string :name
      t.string :slug
      t.text :address
      t.text :directions
      t.decimal :latitude,    :precision => 15, :scale => 12
      t.decimal :longitude,    :precision => 15, :scale => 12

      t.timestamps
    end

    add_index :venues, :slug, unique: true
  end
end
