class CreateAddresses < ActiveRecord::Migration
  def change
    create_table :addresses do |t|
    	t.float :latitude
    	t.float :longitude
    	t.string :street
    	t.string :city
    	t.string :state
    	t.integer :zip
    	t.integer :venue_id
    	t.integer :venue_rep_id
    	t.integer :visual_artist_id
    	t.integer :musician_id
      t.timestamps null: false
    end
  end
end
