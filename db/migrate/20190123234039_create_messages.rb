class CreateMessages < ActiveRecord::Migration[5.2]
  def change
    create_table :messages do |t|
      t.integer :room_id, null: false, default: 0
      t.boolean :master, null: false, default: false
      t.text :text

      t.timestamps
    end
  end
end
