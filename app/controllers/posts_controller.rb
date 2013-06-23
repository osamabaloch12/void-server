class PostsController < ApplicationController

  def create
    @post = Post.new(params[:post])

    if @post.save
      @user = User.where(:void_id => params[:user][:void_id]).first

      if @user.nil?
        @user = User.new(params[:user])

        if !@user.save
          render :json => @user.errors, :status => :unprocessable_entity
          return
        end
      end

      @user.posts << @post
      render :json => @post.to_json(:methods => [:image_url]), :status => :ok
    else
      render :json => @post.errors, :status => :unprocessable_entity
    end
  end

end
