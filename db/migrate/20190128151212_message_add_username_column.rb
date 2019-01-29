class MessageAddUsernameColumn < ActiveRecord::Migration[5.2]
  def change
    add_column :messages, :username, :string
    add_column :messages, :uuid, :string
  end
end
