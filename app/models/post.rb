class Post < ActiveRecord::Base
  has_many :users, :through => :users_posts

  has_attached_file :image, styles: {
    thumb: '100x100>',
    square: '200x200#',
    medium: '300x300>'
  }

  # get a random post that this user has not already received
  def self.random(user)

  end

end
