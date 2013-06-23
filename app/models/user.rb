class User < ActiveRecord::Base
  has_many :posts, :through => :users_posts

  attr_accessible :void_id
end
