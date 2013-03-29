class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :project_type
      t.string :name
      t.string :slug
      t.text :description
      t.string :website
      t.string :source_code
      t.string :pic

      t.timestamps
    end
    add_index :projects, :slug, :unique => true
  end
end
