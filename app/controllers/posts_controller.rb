class PostsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @posts = Post.where(author_id: @user.id).includes(:comments, :author).paginate(page: params[:page], per_page: 4)
  end

  def show
    @user = User.find(params[:user_id])
    @post = Post.find(params[:id])
    @comment = Comment.new
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.author = current_user

    if @post.save
      flash[:success] = 'Your post has been saved!'
      redirect_to user_path(id: @user.id)
    else
      flash[:error] = 'Unable to save comment. Please try later.'
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :text)
  end
end
