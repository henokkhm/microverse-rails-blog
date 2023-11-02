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

    it 'includes the right placeholder HTML element in the response' do
      expect(response.body).to include('<h1>List of All Users</h1>')
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

    it 'includes the right placeholder HTML element in the response' do
      expect(response.body).to include('<h1>Details Page for a Specific User</h1>')
    end
  end
end
