require 'rails_helper'

RSpec.describe Post, type: :model do
  before :each do
    @user = User.new(name: 'Henok', posts_counter: 0)
  end

  # Unit tests for title
  it '.valid should be true when title is present' do
    post = Post.new(author: @user, title: 'Title')
    expect(post).to be_valid
  end

  it '.valid should be false when title is not present' do
    post = Post.new(author: @user)
    expect(post).to_not be_valid
  end

  it '.valid should be false when title is longer than 250 characters' do
    post = Post.new(author: @user, title: 'Title' * 100)
    expect(post).to_not be_valid
  end

  # Unit tests for comments_counter
  it '.valid should be true with zero as comments_counter' do
    post = Post.new(author: @user, title: 'Title', comments_counter: 0)
    expect(post).to be_valid
  end

  it '.valid should be true with positive comments_counter' do
    post = Post.new(author: @user, title: 'Title', comments_counter: 5)
    expect(post).to be_valid
  end

  it '.valid should be false with a negative number as comments_counter' do
    post = Post.new(author: @user, title: 'Title', comments_counter: -5)
    expect(post).to_not be_valid
  end

  # Unit tests for likes_counter
  it '.valid should be true with zero as likes_counter' do
    post = Post.new(author: @user, title: 'New Post', likes_counter: 0)
    expect(post).to be_valid
  end

  it '.valid should be true with positive likes_counter' do
    post = Post.new(author: @user, title: 'New Post', likes_counter: 5)
    expect(post).to be_valid
  end

  it '.valid should be false with a negative number as likes_counter' do
    post = Post.new(author: @user, title: 'New Post', likes_counter: -5)
    expect(post).to_not be_valid
  end

  # Unit tests for last_five_comments method
  context '.last_five_comments should' do
    # helpers
    def create_comment(post, user, text, created_at)
      Comment.create(post:, user:, text:, created_at:)
    end

    def expect_comments_to_be_in_descending_order
      @last_five_comments.each_cons(2) do |comment, next_comment|
        expect(comment.created_at).to be >= next_comment.created_at
      end
    end
    ##########

    before :each do
      @post = Post.create(title: 'Title', author: @user, created_at: 10.days.ago)
      @comment1 = create_comment(@post, @user, 'Comment 1', 9.days.ago)
      @comment2 = create_comment(@post, @user, 'Comment 2', 8.days.ago)
      @comment3 = create_comment(@post, @user, 'Comment 3', 7.days.ago)
      @comment4 = create_comment(@post, @user, 'Comment 4', 6.days.ago)
      @comment5 = create_comment(@post, @user, 'Comment 5', 5.days.ago)
      @comment6 = create_comment(@post, @user, 'Comment 6', 4.days.ago)
      @last_five_comments = Post.last_five_comments(@post)
    end

    it 'return only the five most recent comments' do
      expect(@last_five_comments.count).to eq(5)
      expect(@last_five_comments).to_not include(@comment1)
      expect(@last_five_comments).to include(@comment2)
      expect(@last_five_comments).to include(@comment3)
      expect(@last_five_comments).to include(@comment4)
      expect(@last_five_comments).to include(@comment5)
      expect(@last_five_comments).to include(@comment6)
    end

    it 'return comments in decending order' do
      expect_comments_to_be_in_descending_order
    end
  end
end
