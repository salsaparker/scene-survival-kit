class CreateVenues < ActiveRecord::Migration
  def change
    create_table :venues do |t|
    	t.string :title
    	t.integer :event_id
    	t.integer :venue_rep_id
      t.timestamps null: false
    end
  end
end
