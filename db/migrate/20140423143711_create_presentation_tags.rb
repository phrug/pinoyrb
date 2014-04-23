class CreatePresentationTags < ActiveRecord::Migration
  def change
    create_table :presentation_tags do |t|
      t.references :presentation, index: true
      t.references :tag, index: true

      t.timestamps
    end
  end
end
