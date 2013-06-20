class PostsController < ApplicationController

  def create
    Rails.logger.info(params.inspect)
    # post = Post.new(params[:post])
  	# create a post for the specified user
  	# if the user id can't be found
  	# create a user with the given id and create the post

  	# after creation has happened assign a random post to this user
  	# hen somehow let them know that it happened...
    render :nothing => true, :status => :ok, :content_type => 'text/html'
  end

  def show
  	# get a post
  	# probably called after the user is notified that
  	# that a new post is available
  end

  def index
  	# get a user's stream of posts
  	#
  end

  def destroy
  	# remove this post from the user's feed
  end

end
