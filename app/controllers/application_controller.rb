class ApplicationController < ActionController::Base
  protect_from_forgery

  def index
  	# show the splash page
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

      # give the user their first post
      @random_post = Post.random(@user)
      unless @random_post.nil?
        @user.random_posts << @random_post
      end
    end
  end

end
