class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :event_name
      t.text :event_desc
      t.datetime :event_start
      t.integer :user_id
      t.integer :venue_id
      t.timestamps null: false
    end
  end
end

    