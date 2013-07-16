class AddDeletedToUserRandomPost < ActiveRecord::Migration
  def change
  	add_column :users_random_posts, :deleted, :boolean, :default => false
  end
end
