class AddProofileIdTypesToPhotos < ActiveRecord::Migration
  def change
    add_column :photos, :musician_id, :integer
    add_column :photos, :visual_artist_id, :integer
    add_column :photos, :venue_rep_id, :integer
  end
end
