class CreateVisualArtists < ActiveRecord::Migration
  def change
    create_table :visual_artists do |t|
      t.string :artist

      t.timestamps null: false
    end
  end
end
