require 'rails_helper'

RSpec.describe User, type: :model do
  it '.valid is true when name is present'
  it '.valid is false when name is not present'
  it 'is valid with zero as post counter'
  it 'is valid with positive post counter'
  it 'is not valid with negative number as post counter'
  it 'last_three_posts returns only the three most recent posts'
  it 'last_three_posts returns post in decending order'
end
