require 'rails_helper'

# The following tests assume that the seeds of the database in /db/seeds.rb have been
# added to the database. This can be done by running the 'bin/rails db:reset' command
RSpec.describe 'Post show page', type: :system do
  describe "When user visits Oscar's first post show page" do
    before(:example) do
      oscar = User.find(4) # Oscar has id of 4
      oscars_first_post = Post.where(title: "Oscar's first post").first
      visit user_post_path(oscar, oscars_first_post)
    end

    it "displays the post's title" do
      expect(page).to have_content("Oscar's first post")
    end

    it 'displays who wrote the post' do
      expect(page).to have_content('Oscar')
    end

    it 'displays how many comments the post has' do
      expect(page).to have_content('Comments: 2')
    end

    it 'displays how many likes the post has' do
      expect(page).to have_content('Likes: 3')
    end

    it 'displays the post body' do
      expect(page).to have_content("Oscar's first post")
    end

    it 'displays the username of each commentor' do
      expect(page).to have_content('Alice')
      expect(page).to have_content('Tom')
    end

    it 'displays the comment each commentor left' do
      expect(page).to have_content("Alice's first comment")
      expect(page).to have_content("Tom's second comment")
    end
  end
end
