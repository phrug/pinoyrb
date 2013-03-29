class CreateSpeakers < ActiveRecord::Migration
  def change
    create_table :speakers do |t|
      t.references :presentation
      t.references :user
      t.text :custom_bio

      t.timestamps
    end
    add_index :speakers, :presentation_id
    add_index :speakers, :user_id
  end
end
