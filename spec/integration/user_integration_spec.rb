require 'rails_helper'

RSpec.describe 'Index/Show Users page.', type: :system do
  subject!(:user) { User.where(name: 'Tony').first }

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
      visit('http://localhost:3000/')
    end

    it 'Shows all user\'s usernames' do
      expect(page).to have_content('Peter')
      expect(page).to have_content('Tony')
      expect(page).to have_content('Clint')
    end

    it 'Shows profile picture of each user' do
      image = page.all('img')
      expect(image.size).to eq(3)
    end

    it 'Shows the number of posts each user has written' do
      expect(page).to have_content('Number of Posts: 0')
      expect(page).to have_content('Number of Posts: 4')
      expect(page).to have_content('Number of Posts: 1')
    end

    it 'Redirects to User\'s page when clicked' do
      click_link('Tony')
      expect(page).to have_current_path user_path(user.id)
      expect(page).to have_content(user.bio)
    end
  end

  describe 'Visit Show page.', type: :system do
    subject!(:user) { User.where(name: 'Tony').first }
    subject!(:post) { Post.first }

    before(:all) do
      driven_by(:selenium_chrome_headless)
    end

    before(:example) do
      visit("http://localhost:3000/users/#{user.id}/")
    end

    it 'Shows user\'s profile picture' do
      expect(page.all('img').size).to eq(1)
    end

    it 'Shows user\'s username' do
      expect(page).to have_content('Tony')
    end

    it 'Shows number of posts user has written' do
      expect(page).to have_content('Number of Posts: 4')
    end

    it 'Shows user\'s bio' do
      expect(page).to have_content(user.bio)
    end

    it 'Shows user\'s first 3 posts' do
      posts = page.all('.post')
      expect(posts.size).to eq(3)
    end

    it 'Shows button that leads to user\'s posts' do
      link = find_link('See all posts', href: "/users/#{user.id}/posts")
      expect(link).not_to be_nil
    end

    it 'Redirects to user\'s posts page when See All Posts button is clicked' do
      click_link('See all posts')
      expect(page).to have_current_path "http://localhost:3000/users/#{user.id}/posts"
    end

    it 'Redirects to post\'s show page when See full Post button is clicked' do
      visit("http://localhost:3000/users/#{user.id}/posts")
      click_link('See full Post', match: :first)
      expect(page).to have_content('Your selected Post')
    end
  end
end
