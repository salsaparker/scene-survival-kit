class AddProfileToPlaylists < ActiveRecord::Migration
  def change
    add_column :playlists, :profile_id, :integer
    add_column :playlists, :user_id, :integer
  end
end
