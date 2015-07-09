class CreateVenueReps < ActiveRecord::Migration
  def change
    create_table :venue_reps do |t|
      t.integer :profile_id
      t.timestamps null: false
    end
  end
end
