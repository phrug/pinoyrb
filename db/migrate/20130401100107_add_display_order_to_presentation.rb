class AddDisplayOrderToPresentation < ActiveRecord::Migration
  def change
    add_column :presentations, :display_order, :integer
  end
end
