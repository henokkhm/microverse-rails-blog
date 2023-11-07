require 'rails_helper'

RSpec.describe 'post index view page', type: :system do
  let!(:user1) do
    User.create(
      name: 'test user1',
      photo: 'https://example.com/user1.jpg', 
      bio: 'test_bio1',
      posts_counter: 1
    )
  end

  let!(:post1) do
    Post.create(author: user1, title: 'Post 1', text: 'Post 1 content', comments_counter: 1, likes_counter: 0)
  end

  let!(:post2) do
    Post.create(author: user1, title: 'Post 2', text: 'Post 2 content', comments_counter: 1, likes_counter: 0)
  end

  let!(:comment1) do
    Comment.create(post: post1, user: user1, text: 'nice!')
  end

  let!(:comment2) do
    Comment.create(post: post1, user: user1, text: 'great!')
  end

  describe 'show correct posts for user1' do
    before(:example) do
      visit user_posts_path(user1)
    end
    it 'displays the user\'s username' do
      expect(page).to have_content(user1.name)
    end

    it 'displays the user\'s profile picture' do
      expect(page).to have_selector("img[src='#{user1.photo}']")
    end

    it 'displays the number of posts the user has written' do
      expect(page).to have_content("Number of posts: #{user1.posts_counter}")
    end
    it 'displays the first comments on a post' do
      expect(page).to have_content(comment1.text)
    end
    
  end
end
