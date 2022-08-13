require 'rails_helper'

RSpec.describe Post, type: :model do
  this_user = User.new(name: 'Luke', photo: 'photo_URL', bio: 'Test Dummy', post_counter: 1)
  this_user.save

  this_post = Post.new(author: this_user, title: 'Appropiate Title', text: 'Lorem Ipsum etc', comments_counter: 1,
                       likes_counter: 1)
  this_post.save

  describe 'Post Validation' do
    context 'Successful Case'
    it 'Validation is Succesful new Post created' do
      expect(this_post).to be_valid
    end
  end

  describe 'Post Validation Fails for Title' do
    context 'Fails' do
      before { this_post.title = 'o' * 255 }
      it 'if title over 250 chars' do
        expect(this_post).not_to be_valid
      end
    end

    context 'Fails' do
      before { this_post.title = nil }
      it 'if no title' do
        expect(this_post).not_to be_valid
      end
    end

    context 'Fails' do
      before { this_post.title = '' }
      it 'if blank title on post' do
        expect(this_post).not_to be_valid
      end
    end
  end

  describe 'Post Validation Fails for Comment Counter' do
    context 'Fails' do
      before do
        this_post.title = 'Appropiate Title'
        this_post.comments_counter = -5
      end
      it 'if negative comment count' do
        expect(this_post).not_to be_valid
      end
    end

    context 'Fails' do
      before { this_post.comments_counter = 'eight' }
      it 'if string comment count' do
        expect(this_post).not_to be_valid
      end
    end
  end

  describe 'Post Validation Fails for Likes Counter' do
    context 'Fails' do
      before do
        this_post.comments_counter = 1
        this_post.likes_counter = -5
      end
      it 'if negative like count' do
        expect(this_post).not_to be_valid
      end
    end

    context 'Fails' do
      before { this_post.likes_counter = 'eight' }
      it 'if string like count' do
        expect(this_post).not_to be_valid
      end
    end
  end

  describe 'Method Functionality' do
    context 'Recent comment method works properly' do
      it 'returns a valid type' do
        expect(this_post.recent_comments.length).to eq(0)
        Comment.create(author: this_user, post: this_post, text: 'FIRST!')
        expect(this_post.recent_comments.length).to eq(1)
      end
    end

    context 'Update posts counter' do
      before do
        Post.new(author: this_user, title: 'new post', text: 'Lorem Ipsum etc', comments_counter: 0, likes_counter: 0)
      end
      it 'should add +1 to posts counter' do
        expect(this_user.post_counter).to eq(2)
      end
    end
  end
end
