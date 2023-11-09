require 'rails_helper'

# The following tests assume that the seeds of the database in /db/seeds.rb have been
# added to the database. This can be done by running the 'bin/rails db:reset' command
RSpec.describe 'Post index page', type: :system do
  describe "When user visits Oscar's post index page" do
    before(:example) do
      oscar = User.find(4) # Oscar has id of 4
      visit user_posts_path(oscar)
    end

    it "displays Oscar's profile picture" do
      oscar = User.find(4) # Oscar has id of 4
      expect(page).to have_selector("img[src='#{oscar.photo}']")
    end

    it "displays Oscar's username" do
      expect(page).to have_content('Oscar')
    end

    it 'displays the number of posts Oscar has' do
      expect(page).to have_content('Number of posts: 4')
    end

    it "displays Oscar's first post's title" do
      expect(page).to have_content("Oscar's first post")
    end

    it "displays some of Oscar's first post's body" do
      expect(page).to have_content("Oscar's first post...")
    end

    it "displays the first few comments on Oscar's first post" do
      expect(page).to have_content("Alice's first comment")
      expect(page).to have_content("Tom's second comment")
    end

    it "displays how many comments Oscar's first post has" do
      expect(page).to have_content('Comments: 2')
    end

    it "displays how many likes Oscar's first post has" do
      expect(page).to have_content('Likes: 3')
    end

    it "redirects to the post's show page when user clicks on Oscar's first post's card" do
      oscar = User.find(4) # Oscar has id of 4
      oscars_first_post = Post.where(title: "Oscar's first post").first
      click_link oscars_first_post.title
      expect(page).to have_current_path(user_post_path(oscar, oscars_first_post))
      expect(page).to have_content("Oscar's first post")
      expect(page).to have_content('New comment')
    end
  end
end
