class CreateLinks < ActiveRecord::Migration
  def change
    create_table :links do |t|
      t.string :url
      t.string :link_type
      t.string :linkable_type
      t.integer :linkable_id

      t.timestamps
    end
  end
end
