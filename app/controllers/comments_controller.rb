class CommentsController < ApplicationController
  def new
    @comment = Comment.new
  end

  def create
    @comment = Comment.new(comment_params)
    @post = Post.find(params[:post_id])
    @comment.user = current_user
    @comment.post_id = @post.id

    if @comment.save
      flash[:success] = 'Your comment has been saved!'
      redirect_to user_post_path(user_id: @post.author, id: @post.id)
    else
      flash[:error] = 'Unable to save comment. Please try later.'
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:text)
  end
end
