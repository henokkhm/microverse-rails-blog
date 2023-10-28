require 'rails_helper'

RSpec.describe Like, type: :model do
  # helpers
  def create_post(_user, title, created_at)
    Post.create(title:, author: @user, created_at:)
  end

  def create_like(post, user, created_at)
    Like.create(post:, user:, created_at:)
  end
  ######

  before :all do
    @user = User.new(name: 'Henok', posts_counter: 0)
    @post1 = create_post(@user, 'Hello world!', 4.days.ago)
  end

  # Unit tests for .update_likes_counter
  it '.update_likes_counter should increment likes_counter after a new like is added' do
    expect(@post1.likes_counter).to eq(0)
    @like1 = create_like(@post1, @user, 3.days.ago)
    @like2 = create_like(@post1, @user, 2.days.ago)
    expect(@post1.likes_counter).to eq(2)
  end
  ######
end
