class CreateRooms < ActiveRecord::Migration[5.2]
  def change
    create_table :rooms do |t|
      t.string :title, null: false, default: ""
      t.integer :user_id, null: false, default: 1

      t.timestamps
    end
  end
end
