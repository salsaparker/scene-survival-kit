class CreateVenueReps < ActiveRecord::Migration
  def change
    create_table :venue_reps do |t|
      t.string :rep

      t.timestamps null: false
    end
  end
end
