class Post < ActiveRecord::Base
  has_many :users, :through => :users_posts

  attr_accessible :image, :location, :message

  has_attached_file :image, styles: {
    thumb: '720x720!'
  }

  # get a random post that this user has not already received
  def self.random(user)
  end

end
