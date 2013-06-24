class PostsController < ApplicationController

  before_filter :init_user

  def create
    @post = Post.new(params[:post])

    if @post.save
      init_user

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
    render :json => @user.random_posts.to_json(:methods => [:image_url]), :status => :ok
  end

  private

  def init_user
    unless params[:user] && params[:user][:void_id]
      render :nothing => true, :status => :bad_request
      return false
    end

    @user = User.where(:void_id => params[:user][:void_id]).first
    if @user.nil?
      @user = User.new(params[:user])

      if !@user.save
        render :json => @user.errors, :status => :unprocessable_entity
        return false
      end
    end
  end

end
