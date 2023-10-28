require 'rails_helper'

RSpec.describe User, type: :model do
  # Unit tests for name
  it '.valid should be true when name and posts_counter are present' do
    user = User.new(name: 'Henok', posts_counter: 0)
    expect(user).to be_valid
  end

  it '.valid should be false when name is not present' do
    user = User.new(posts_counter: 0)
    expect(user).to_not be_valid
  end
  ######

  # Unit tests for posts_counter
  it '.valid should be true with zero as posts_counter' do
    user = User.new(name: 'Henok', posts_counter: 0)
    expect(user).to be_valid
  end

  it '.valid should be true with positive posts_counter' do
    user = User.new(name: 'Henok', posts_counter: 5)
    expect(user).to be_valid
  end

  it '.valid should be false with a negative number as posts_counter' do
    user = User.new(name: 'Henok', posts_counter: -5)
    expect(user).to_not be_valid
  end
  ######

  # Unit tests for .last_three_posts method
  context '.last_three_posts should' do
    # helpers
    def create_post(_user, title, created_at)
      Post.create(title:, author: @user, created_at:)
    end

    def expect_posts_to_be_in_descending_order
      @last_three_posts.each_cons(2) do |post, next_post|
        expect(post.created_at).to be >= next_post.created_at
      end
    end
    ##########

    before :all do
      @user = User.new(name: 'Henok', posts_counter: 0)
      @post1 = create_post(@user, 'Hello world!', 4.days.ago)
      @post2 = create_post(@user, 'This is my blog', 3.days.ago)
      @post3 = create_post(@user, 'This is my first post', 2.day.ago)
      @post4 = create_post(@user, 'This is my second post', 1.day.ago)
      @last_three_posts = User.last_three_posts(@user)
    end

    it 'return only the three most recent posts' do
      expect(@last_three_posts.count).to eq(3)
      expect(@last_three_posts).to include(@post2)
      expect(@last_three_posts).to include(@post3)
      expect(@last_three_posts).to include(@post4)
    end

    it 'return posts in decending order' do
      expect_posts_to_be_in_descending_order
    end
  end
  ######
end
