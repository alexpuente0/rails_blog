require 'rails_helper'

RSpec.describe 'Users', type: :request do
  describe 'Get page post #index' do
    before(:each) do
      get '/users/3/posts'
    end

    it 'shows user\'s posts successfully' do
      expect(response).to have_http_status(:ok)
    end

    it 'renders template correctly' do
      expect(response).to render_template('index')
    end

    it 'renders and placeholder matches content' do
      expect(response.body).to include 'All posts'
    end
  end

  describe 'GET user page #show' do
    before(:each) do
      get '/users/3/posts/6'
    end

    it 'shows selected post successfully' do
      expect(response).to have_http_status(:ok)
    end

    it 'renders template correctly' do
      expect(response).to render_template('show')
    end

    it 'renders and placeholder matches content' do
      expect(response.body).to include 'selected'
    end
  end
end
