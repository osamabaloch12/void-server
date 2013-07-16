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
    render :json => @user.ordered_random_posts.to_json(:methods => [:image_url]), :status => :ok
  end

  def destroy
    # disconnect the user from the given post
    @post = @user.users_random_posts.where(:post_id => params[:id]).first

    if @post
      @post.destroy
      render :nothing => :true, :status => :no_content
    else
      render :nothing => :true, :status => :not_found
    end
  end

  private

  def find_or_create_user
    if !params[:user_id]
      render :nothing => true, :status => :bad_request and return false
    end

    @user = User.where(:void_id => params[:user_id]).first
    if @user.nil?
      @user = User.new(:void_id => params[:user_id])

      if !@user.save
        render :json => @user.errors, :status => :unprocessable_entity and return false
      end
    end
  end

end
