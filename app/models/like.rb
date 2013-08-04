class Like < ActiveRecord::Base
  belongs_to :post
  belongs_to :user

  attr_accessible :user_id, :post_id

  validates :post_id, :uniqueness => { :scope => :user_id }
end
