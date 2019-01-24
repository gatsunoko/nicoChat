class CreateChats < ActiveRecord::Migration[5.2]
  def change
    create_table :chats do |t|
      t.integer :room_id, null: false, default: 0
      t.boolean :master, null: false, default: false
      t.text :messages

      t.timestamps
    end
  end
end
