class LikesController < ApplicationController
  before_action :find_post

  def create
    @post.likes.create(user: current_user)
  
    respond_to do |format|
      format.html { redirect_back fallback_location: posts_path }
      format.js { render 'create' } # Explicit render
    end
  end
  
  def destroy
    @post.likes.find_by(user: current_user).destroy
  
    respond_to do |format|
      format.html { redirect_back fallback_location: posts_path }
      format.js { render 'destroy' } # Explicit render
    end
  end
  
  

  private

  def find_post
    @post = Post.find(params[:post_id])
  end
end
