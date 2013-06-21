class AddAvatarToPosts < ActiveRecord::Migration
  def change
  	add_attachment :posts, :avatar
  end
end
