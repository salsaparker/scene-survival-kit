class CreateSearches < ActiveRecord::Migration
  def change
    create_table :searches do |t|
      t.string :keywords
      t.string :category
      t.integer :zip
      t.string :state
      t.string :instrument
      t.string :genre
      t.string :name

      t.timestamps null: false
    end
  end
end
