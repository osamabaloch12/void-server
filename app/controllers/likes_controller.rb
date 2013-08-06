class LikesController < ApplicationController
  before_filter :find_or_create_user, :find_post

  def create
    @like = Like.new(:post_id => @post.id, :user_id => @user.id)

    if @like.save
      head :no_content
    else
      head :unprocessable_entity
    end
  end

  def destroy
    @like = Like.where(:post_id => @post.id, :user_id => @user.id).first

    if @like
      @like.destroy
      head :no_content
    else
      head :not_found
    end
  end

  private

  def find_post
    @post = Post.where(:id => params[:id]).first
  end
end
