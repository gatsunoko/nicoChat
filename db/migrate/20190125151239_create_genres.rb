class CreateGenres < ActiveRecord::Migration[5.2]
  def change
    create_table :genres do |t|
      t.string :title
      t.string :enum_key

      t.timestamps
    end
  end
end
