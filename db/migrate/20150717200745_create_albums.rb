class CreateAlbums < ActiveRecord::Migration
  def change
    create_table :albums do |t|
      t.string :album_name
      t.belongs_to :visual_artist
      t.belongs_to :venue_rep
      t.belongs_to :musician
      t.belongs_to :profile
      t.timestamps null: false
    end
  end
end
