class PostsController < ApplicationController

  before_filter :find_or_create_user

  def create
    @post = Post.new(params[:post])

    if @post.save

      @user.posts << @post
      @random_post = Post.random(@user)

      if @random_post.nil?
        render :json => Post.new.to_json(:methods => [:image_url]), :status => :multi_status
      else
        @user.random_posts << @random_post
        render :json => @random_post.to_json(:methods => [:image_url]), :status => :ok
      end
    else
      render :json => @post.errors, :status => :unprocessable_entity
    end
  end

  def index
    render :json => @user.active_random_posts.to_json(:methods => [:image_url]), :status => :ok
  end

  def destroy
    # disconnect the user from the given post
    @urp = @user.users_random_posts.where(:post_id => params[:id]).first

    if @urp
      @urp.deleted = true
      @urp.save
      head :no_content
    else
      head :not_found
    end
  end

end
