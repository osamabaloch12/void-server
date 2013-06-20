class User < ActiveRecord::Base
  has_many :posts, :through => :users_posts
end
