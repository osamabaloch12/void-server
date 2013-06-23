class AddVoidIdToUsers < ActiveRecord::Migration
  def change
    remove_column :users, :device_id
    remove_column :users, :installation_id
    add_column :users, :void_id, :string
  end
end
