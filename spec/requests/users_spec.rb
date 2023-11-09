require 'rails_helper'

RSpec.describe 'Users controller', type: :request do
  describe 'GET request to endpoint "/users"' do
    before :each do
      get users_path
    end

    it 'returns successful response' do
      expect(response).to be_successful
    end

    it 'renders the correct template' do
      expect(response).to render_template(:index)
    end
  end

  describe 'GET request to endpoint "/users/:id"' do
    before :each do
      @user = User.create(name: 'Henok', posts_counter: 0)
      get user_path(@user)
    end

    it 'return successful response' do
      expect(response).to be_successful
    end

    it 'renders the correct template' do
      expect(response).to render_template(:show)
    end
  end
end
