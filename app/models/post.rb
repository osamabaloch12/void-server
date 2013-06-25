class Post < ActiveRecord::Base
  has_many :users_posts
  has_many :users, :through => :users_posts
  has_many :users_random_posts
  has_many :random_users, :through => :users_random_posts, :source => :user

  attr_accessible :image, :location, :message

  has_attached_file :image, :styles => { :thumb => { :geometry => '720x720!', :auto_orient => false } }

  # get a random post that this user has not already received
  def self.random(user)
    related_posts = user.related_posts
    Post.where('id NOT IN (?)', related_posts.map(&:id)).first(:offset => rand(Post.count - related_posts.count))
  end

  def image_url
  	image.url(:thumb)
  end

end
