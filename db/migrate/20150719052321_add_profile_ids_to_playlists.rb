class AddProfileIdsToPlaylists < ActiveRecord::Migration
  def change
    add_column :playlists, :musician_id, :integer
    add_column :playlists, :venue_rep_id, :integer
    add_column :playlists, :visual_artist_id, :integer
  end
end
