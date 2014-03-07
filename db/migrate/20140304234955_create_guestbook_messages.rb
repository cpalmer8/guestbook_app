class CreateGuestbookMessages < ActiveRecord::Migration
  def change
    create_table :guestbook_messages do |t|
      t.string :message
      t.timestamp :time
      t.integer :user_id
      t.string :location

      t.timestamps
    end
    add_index :guestbook_messages, [:user_id]
  end
end
