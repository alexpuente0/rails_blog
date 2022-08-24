require 'rails_helper'

RSpec.describe 'Index/Show Posts page.', type: :system do
  subject!(:user) { User.where(name: 'Tony').first }
  subject!(:post) { Post.where(id: 2).first }

  before(:all) do
    driven_by(:selenium_chrome_headless)
    Rails.application.load_seed
  end

  after(:all) do
    Like.destroy_all
    Comment.destroy_all
    Post.destroy_all
    User.destroy_all
  end

  describe 'Visit index page:' do
    before(:example) do
      visit("http://localhost:3000/users/#{user.id}/posts")
    end

    it 'Shows user\'s profile picture' do
      image = page.all('img')
      expect(image[0]['src']).to eq('https://cdn.icon-icons.com/icons2/1378/PNG/512/avatardefault_92824.png')
    end

    it 'Shows user\'s username' do
      expect(page).to have_content('Tony')
    end

    it 'Shows user\'s number of written posts.' do
      expect(page).to have_content('Number of Posts: 4')
    end

    it 'Shows the post\'s title' do
      expect(page).to have_content('Hello')
    end

    it 'Shows part of the posts body' do
      expect(page).to have_content('This is my first post')
    end

    it 'Shows the first comments on a post' do
      expect(page).to have_content('How you doing?')
    end

    it 'Shows number of comments in post' do
      expect(page).to have_content('comments: 6')
    end

    it 'Shows number of likes in a post' do
      expect(page).to have_content('Likes: 0')
    end

    it 'Shows pagination button if there are more posts than fit on the view' do
      expect(page).to have_content('Pagination')
    end

    it 'Redirects to post\'s show page when See full Post button is clicked' do
      click_link('See full Post', match: :first)
      expect(page).to have_current_path "http://localhost:3000/users/#{user.id}/posts/#{post.id}"
    end
  end

  describe 'Visit Show page.', type: :system do
    subject!(:user) { User.where(name: 'Tony').first }
    subject!(:post) { Post.where(id: 1).first }

    before(:all) do
      driven_by(:selenium_chrome_headless)
    end

    before(:example) do
      visit("http://localhost:3000/users/#{user.id}/posts/#{post.id}")
    end

    it 'Shows post\'s title' do
      expect(page).to have_content('This is my first post')
    end

    it 'Shows who wrote the selected post' do
      expect(page).to have_content('by Tony')
    end

    it 'Shows how many comments post has' do
      expect(page).to have_content('comments: 6')
    end

    it 'Shows how many likes post has' do
      expect(page).to have_content('Likes: 0')
    end

    it 'Shows the post\'s body (text)' do
      expect(page).to have_content('This is my first post')
    end

    it 'Shows each commenter\'s username' do
      expect(page).to have_content('Clint : ')
      expect(page).to have_content('Peter : ')
    end

    it 'Shows each commenter\'s comment' do
      expect(page).to have_content('Hi!')
      expect(page).to have_content('How you doing?')
    end
  end
end
