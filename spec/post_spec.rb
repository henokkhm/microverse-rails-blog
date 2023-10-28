require 'rails_helper'

RSpec.describe Post, type: :model do
  # Unit tests for title
  it '.valid should be true when title is present'

  it '.valid should be false when title is not present'

  it '.valid should be false when title is longer than 250 characters'

  # Unit tests for comments_counter
  it '.valid should be true with zero as comments_counter'

  it '.valid should be true with positive comments_counter'

  it '.valid should be false with a negative number as comments_counter'

  # Unit tests for likes_counter
  it '.valid should be true with zero as likes_counter'

  it '.valid should be true with positive likes_counter'

  it '.valid should be false with a negative number as likes_counter'

  # Unit tests for last_five_comments method
  context '.last_five_comments should' do
    it 'return only the five most recent comments'

    it 'return comments in decending order'
  end
end
