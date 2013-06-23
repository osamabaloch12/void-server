class CreateUsersRandomPosts < ActiveRecord::Migration
  def change
    create_table :users_random_posts do |t|
      t.integer :post_id
      t.integer :user_id
      t.timestamps
    end
  end
end
