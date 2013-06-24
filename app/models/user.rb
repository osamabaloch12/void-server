class User < ActiveRecord::Base
  has_many :users_posts
  has_many :posts, :through => :users_posts
  has_many :users_random_posts
  has_many :random_posts, :through => :users_random_posts, :source => :post

  attr_accessible :void_id
end
