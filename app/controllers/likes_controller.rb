class LikesController < ApplicationController
  def new
    @like = Like.new
  end

  def create
    @post = Post.find(params[:post_id])
    @like = Like.new(user: current_user, post_id: @post.id)
    if @like.save
      redirect_to user_post_path(user_id: @post.author_id, id: @post.id)
    else
      flash[:error] = 'Unable to save your like. Please try later.'
      render :new
    end
  end
end
