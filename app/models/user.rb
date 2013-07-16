class User < ActiveRecord::Base
  has_many :users_posts
  has_many :posts, :through => :users_posts
  has_many :users_random_posts
  has_many :random_posts, :through => :users_random_posts, :source => :post, :order => '"users_random_posts"."created_at" DESC'

  attr_accessible :void_id

  def active_random_posts
    random_posts.where('"users_random_posts"."deleted" = ?', false)
  end

  def related_posts
    posts | random_posts
  end

  def to_param
    void_id
  end
end
