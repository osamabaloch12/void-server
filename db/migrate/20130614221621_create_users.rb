class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :installation_id
      t.string :device_id
      t.timestamps
    end
  end
end
