class CreateContributors < ActiveRecord::Migration
  def change
    create_table :contributors do |t|
      t.integer :contributor_id
      t.string :contributor_type
      t.references :project
      t.string :role
      t.boolean :current

      t.timestamps
    end
    add_index :contributors, :project_id
    add_index :contributors, :contributor_type
    add_index :contributors, :contributor_id
  end
end
