class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.string :subject
      t.text :message_body, null: false
      t.belongs_to :profile
      t.integer :message_sender_id
      t.integer :message_receiver_id
      t.boolean :reply_read, default: false
      t.timestamps null: false
    end
  end
end
