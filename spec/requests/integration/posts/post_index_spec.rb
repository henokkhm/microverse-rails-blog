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
      expect(page).to have_content('Number of posts: 9')
    end

    it "displays Oscar's latest post's title" do
      expect(page).to have_content("Oscar's ninth post")
    end

    it "displays some of Oscar's latest post's body" do
      expect(page).to have_content("Oscar's ninth post...")
    end

    it "displays the first few comments on Oscar's latest post" do
      expect(page).to have_content("Linda's sixth comment")
      expect(page).to have_content("Alice's fourth comment")
    end

    it "displays how many comments Oscar's latest post has" do
      expect(page).to have_content('Comments: 2')
    end

    it "displays how many likes Oscar's latest post has" do
      expect(page).to have_content('Likes: 3')
    end

    it "redirects to the post's show page when user clicks on Oscar's latest post's card" do
      oscar = User.find(4) # Oscar has id of 4
      oscars_ninth_post = Post.where(title: "Oscar's ninth post").first
      click_link oscars_ninth_post.title
      expect(page).to have_current_path(user_post_path(oscar, oscars_ninth_post))
      expect(page).to have_content("Oscar's ninth post")
      expect(page).to have_content('New comment')
    end
  end
end
