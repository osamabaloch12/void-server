class PostsController < ApplicationController

  def create
    @post = Post.new(params[:post])
    if @post.save
      render :nothing => true, :status => :ok, :content_type => 'text/html'
    else
      render :json => @post.errors, :status => :unprocessable_entity
    end
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