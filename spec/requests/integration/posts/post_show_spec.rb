require 'rails_helper'

RSpec.describe 'post show view page', type: :system do
  let!(:user1) do
    User.create(
      name: 'test user1',
      photo: 'https://images3.alphacoders.com/690/690494.jpg',
      bio: 'test_bio1',
      posts_counter: 1
    )
  end

  let!(:post1) do
    Post.create(author: user1, title: 'Post 1', text: 'Post 1 content', comments_counter: 3, likes_counter: 1)
  end

  let!(:comment1) do
    Comment.create(post: post1, user: user1, text: 'good!')
  end
  let!(:comment2) do
    Comment.create(post: post1, user: user1, text: 'good!')
  end
  let!(:comment3) do
    Comment.create(post: post1, user: user1, text: 'good!')
  end
end
