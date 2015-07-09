class CreateVisualArtists < ActiveRecord::Migration
  def change
    create_table :visual_artists do |t|
      t.string :medium
      t.integer :profile_id
      t.timestamps null: false
    end
  end
end
