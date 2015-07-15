class CreatePlaylists < ActiveRecord::Migration
  def change
    create_table :playlists do |t|
      t.string :playlist_url, null: false
      t.timestamps null: false
    end
  end
end
