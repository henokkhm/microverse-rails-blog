require 'rails_helper'

RSpec.describe Comment, type: :model do
  # helpers
  def create_post(_user, title, created_at)
    Post.create(title:, author: @user, created_at:)
  end

  def create_comment(post, user, text, created_at)
    Comment.create(post:, user:, text:, created_at:)
  end
  ######

  before :all do
    @user = User.new(name: 'Henok', posts_counter: 0)
    @post1 = create_post(@user, 'Hello world!', 4.days.ago)
  end

  # Unit tests for .update_comments_counter
  it '.update_comments_counter should increment comments_counter after a new comment is added' do
    expect(@post1.comments_counter).to eq(0)
    @comment1 = create_comment(@post1, @user, 'Comment 1', 3.days.ago)
    @comment2 = create_comment(@post1, @user, 'Comment 2', 2.days.ago)
    expect(@post1.comments_counter).to eq(2)
  end
  ######
end
