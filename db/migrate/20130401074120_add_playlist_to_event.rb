class AddPlaylistToEvent < ActiveRecord::Migration
  def change
    add_column :events, :youtube_playlist, :string
  end
end
