require 'rails_helper'

RSpec.describe 'Users', type: :request do
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
      get '/users/3'
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
