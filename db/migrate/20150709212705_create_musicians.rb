class CreateMusicians < ActiveRecord::Migration
  def change
    create_table :musicians do |t|
    	t.string :instrument
    	t.string :genre
    	t.integer :profile_id
      t.timestamps null: false
    end
  end
end
