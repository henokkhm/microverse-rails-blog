require 'rails_helper'

RSpec.describe 'Posts contoller', type: :request do
  describe 'GET request to endpoint "/users/:user_id/posts"' do
    before :each do
      @user = User.create(name: 'Henok', posts_counter: 0)
      get user_posts_path(@user)
    end

    it 'returns successful response' do
      expect(response).to be_successful
    end

    it 'renders the correct template' do
      expect(response).to render_template(:index)
    end

    it 'includes the right placeholder HTML element in the response' do
      expect(response.body).to include('<h1>List of All Posts Made by a Specific User</h1>')
    end
  end
end
