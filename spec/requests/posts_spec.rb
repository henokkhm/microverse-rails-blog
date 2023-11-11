require 'rails_helper'

RSpec.describe 'Posts contoller', type: :request do
  describe 'GET request to endpoint "/users/:user_id/posts"' do
    before(:each) do
      @user = User.create(name: 'Henok', email: 'henok@example.com', password: 'passwordhenok')
      get user_posts_path(@user)
    end

    it 'returns successful response' do
      expect(response).to be_successful
    end

    it 'renders the correct template' do
      expect(response).to render_template(:index)
    end
  end

  describe 'GET request to endpoint "/users/:user_id/posts/:post_id"' do
    before(:each) do
      @user = User.create(name: 'Henok', email: 'henok@example.com', password: 'passwordhenok')
      @post = @user.posts.create(title: 'Post 1')
      get user_post_path(@user, @post)
    end

    it 'returns successful response' do
      expect(response).to be_successful
    end

    it 'renders the correct template' do
      expect(response).to render_template(:show)
    end
  end
end
