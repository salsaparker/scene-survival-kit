class CreateReplies < ActiveRecord::Migration
  def change
    create_table :replies do |t|
      t.text :reply_body
      t.belongs_to :message, null: false
      t.belongs_to :profile
      t.integer :message_sender_id
      t.integer :message_receiver_id
      t.boolean :reply_read, default: false
      t.timestamps null: false
    end
  end
end
