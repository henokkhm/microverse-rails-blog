require 'rails_helper'

def cleanup_henok
  henok = User.where(name: 'Henok').first
  return unless henok.present?

  henok.posts.destroy_all
  henok.destroy
end

RSpec.describe User, type: :model do
  before(:each) do
    cleanup_henok
  end

  after(:all) do
    cleanup_henok
  end

  # Unit tests for name
  it '.valid should be true when name and posts_counter are present' do
    user = User.new(name: 'Henok', email: 'henok@example.com', password: 'passwordhenok')
    expect(user).to be_valid
  end

  it '.valid should be false when name is not present' do
    user = User.new(email: 'henok@example.com', password: 'passwordhenok')
    expect(user).to_not be_valid
  end
  ######

  # Unit tests for posts_counter
  it '.valid should be true with zero as posts_counter' do
    user = User.new(name: 'Henok',
                    email: 'henok@example.com',
                    password: 'passwordhenok',
                    posts_counter: 0)
    expect(user).to be_valid
  end

  it '.valid should be true with positive posts_counter' do
    user = User.new(name: 'Henok',
                    email: 'henok@example.com',
                    password: 'passwordhenok',
                    posts_counter: 5)
    expect(user).to be_valid
  end

  it '.valid should be false with a negative number as posts_counter' do
    user = User.new(name: 'Henok',
                    email: 'henok@example.com',
                    password: 'passwordhenok',
                    posts_counter: -5)
    expect(user).to_not be_valid
  end
  ######

  # Unit tests for .last_three_posts method
  context '.last_three_posts should' do
    before(:each) do
      @user = User.create(name: 'Henok', email: 'henok@example.com', password: 'passwordhenok')
      @post1 = Post.create(title: 'Henoks first post.', author: @user, created_at: 5.days.ago)
      @post2 = Post.create(title: 'Henoks second post.', author: @user, created_at: 4.days.ago)
      @post3 = Post.create(title: 'Henoks third post.', author: @user, created_at: 3.days.ago)
      @post4 = Post.create(title: 'Henoks fourth post.', author: @user, created_at: 2.days.ago)
      @last_three_posts = User.last_three_posts(@user)
    end

    it 'return the 3 recent posts' do
      expect(@last_three_posts).to contain_exactly(@post4, @post3, @post2)
    end

    it 'should not return older post' do
      expect(@last_three_posts).to_not contain_exactly(@post1)
    end

    it 'return posts in decending order' do
      @last_three_posts.each_cons(2) do |post, next_post|
        expect(post.created_at).to be >= next_post.created_at
      end
    end
  end
  ######
end
