require 'rails_helper'

# The following tests assume that the seeds of the database in /db/seeds.rb have been
# added to the database. This can be done by running the 'bin/rails db:reset' command
RSpec.describe 'User show page', type: :system do
  describe "When user visits Tom's show page" do
    before(:example) do
      tom = User.find(1) # Tom has an id of 1
      visit user_path(tom)
    end

    it "displays Tom's profile picture" do
      tom = User.find(1)
      expect(page).to have_selector("img[src='#{tom.photo}']")
    end

    it "displays Tom's username" do
      expect(page).to have_content('Tom')
    end

    it 'displays the number of posts Tom has written' do
      tom = User.find(1)
      expect(page).to have_content("Number of posts: #{tom.posts_counter}")
    end

    it "displays Tom's bio" do
      tom = User.find(1)
      expect(page).to have_content(tom.bio)
    end

    it "displays Tom's first 3 posts" do
      expect(page).to have_content("Tom's fifth post")
      expect(page).to have_content("Tom's fourth post")
      expect(page).to have_content("Tom's third post")
    end

    it "displays a button that lets me view all of a Tom's posts" do
      expect(page).to have_link('See all posts')
    end

    it "redirects me to that post's show page when I click a Tom's post" do
      tom = User.find(1)
      click_link 'See all posts'
      sleep(1)
      expect(current_path).to eq(user_posts_path(tom))
    end

    it "redirects me to the Tom's post's index page when I click to see all posts" do
      tom = User.find(1)
      toms_fifth_post = Post.where(title: "Tom's fifth post").first
      visit user_path(tom)

      click_link toms_fifth_post.title
      sleep(1)
      expect(current_path).to eq(user_post_path(tom, toms_fifth_post))
      expect(page).to have_content('Comments')
    end
  end
end
