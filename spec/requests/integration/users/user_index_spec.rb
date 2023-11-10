require 'rails_helper'

# The following tests assume that the seeds of the database in /db/seeds.rb have been
# added to the database. This can be done by running the 'bin/rails db:reset' command
RSpec.describe 'User index page', type: :system do
  describe 'When user visits the users index page' do
    before(:example) do
      visit users_path
    end

    it 'displays the usernames of all users' do
      expect(page).to have_content('Alice')
      expect(page).to have_content('Linda')
      expect(page).to have_content('Tom')
      expect(page).to have_content('Oscar')
    end

    it 'displays the profile picture for each user' do
      tom = User.find(1)
      alice = User.find(2)
      linda = User.find(3)
      oscar = User.find(4)
      expect(page).to have_selector("img[src='#{tom.photo}']")
      expect(page).to have_selector("img[src='#{alice.photo}']")
      expect(page).to have_selector("img[src='#{linda.photo}']")
      expect(page).to have_selector("img[src='#{oscar.photo}']")
    end

    it 'displays the number of posts each user has written' do
      tom = User.find(1)
      alice = User.find(2)
      linda = User.find(3)
      oscar = User.find(4)
      expect(page).to have_content("Number of posts: #{tom.posts_counter}")
      expect(page).to have_content("Number of posts: #{alice.posts_counter}")
      expect(page).to have_content("Number of posts: #{linda.posts_counter}")
      expect(page).to have_content("Number of posts: #{oscar.posts_counter}")
    end

    it "redirects to a user's show page when a user's card is clicked" do
      linda = User.find(3)
      click_link linda.name
      sleep(1)
      expect(current_path).to eq(user_path(linda))
    end
  end
end
