require 'rails_helper'

RSpec.describe 'Users Path', type: :request do
  before(:all) do
    @this_user = User.create(name: 'Malcolm', photo: 'Photo_URL', bio: 'Im in the Middle', post_counter: 0)
    @this_post = Post.create(author: @this_user, title: 'Test Post', text: 'This is a test post', likes_counter: 0,
                             comments_counter: 0)
  end

  after(:all) do
    Like.destroy_all
    Comment.destroy_all
    Post.destroy_all
    User.destroy_all
  end

  describe 'GET users page #index' do
    before(:each) do
      get '/users'
    end

    it 'shows users successfully' do
      expect(response).to have_http_status(:ok)
    end

    it 'renders template correctly' do
      expect(response).to render_template('index')
    end

    it 'renders and placeholder matches content' do
      expect(response.body).to include 'current Users'
    end
  end

  describe 'GET user page #show' do
    before(:each) do
      get "/users/#{@this_user.id}"
    end

    it 'shows selected user successfully' do
      expect(response).to have_http_status(:ok)
    end

    it 'renders template correctly' do
      expect(response).to render_template('show')
    end

    it 'renders and placeholder matches content' do
      expect(response.body).to include 'Selected user'
    end
  end
end
