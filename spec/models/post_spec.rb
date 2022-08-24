require 'rails_helper'

RSpec.describe Post, type: :model do
  before do
    @this_user = User.new(name: 'Luke', photo: 'photo_URL', bio: 'Test Dummy', post_counter: 1)
    @this_post = Post.new(author: @this_user, title: 'Appropiate Title', text: 'Lorem Ipsum etc', comments_counter: 1,
                          likes_counter: 1)
    @this_post.save
  end

  after(:all) do
    Like.destroy_all
    Comment.destroy_all
    Post.destroy_all
    User.destroy_all
  end

  it 'Validation is Succesful new Post created' do
    @this_post.likes_counter = 0
    @this_post.comments_counter = 0
    expect(@this_post).to be_valid
  end

  it 'Post Validation Fails for Title over 250 chars' do
    @this_post.likes_counter = 0
    @this_post.comments_counter = 0
    @this_post.title = 'o' * 255
    expect(@this_post).not_to be_valid
  end

  context 'Fails' do
    before { @this_post.title = nil }
    it 'if no title' do
      expect(@this_post).not_to be_valid
    end
  end

  context 'Fails' do
    before { @this_post.title = '' }
    it 'if blank title on post' do
      expect(@this_post).not_to be_valid
    end
  end

  describe 'Post Validation Fails for Comment Counter' do
    context 'Fails' do
      before do
        @this_post.title = 'Appropiate Title'
        @this_post.comments_counter = -5
      end
      it 'if negative comment count' do
        expect(@this_post).not_to be_valid
      end
    end

    context 'Fails' do
      before { @this_post.comments_counter = 'eight' }
      it 'if string comment count' do
        expect(@this_post).not_to be_valid
      end
    end
  end

  describe 'Post Validation Fails for Likes Counter' do
    context 'Fails' do
      before do
        @this_post.comments_counter = 1
        @this_post.likes_counter = -5
      end
      it 'if negative like count' do
        expect(@this_post).not_to be_valid
      end
    end

    context 'Fails' do
      before { @this_post.likes_counter = 'eight' }
      it 'if string like count' do
        expect(@this_post).not_to be_valid
      end
    end
  end

  it 'Method Functionality for Recent posts' do
    @this_post.likes_counter = 0
    @this_post.comments_counter = 0
    @this_post.save
    Comment.create(author: @this_user, post: @this_post, text: 'Text1')
    Comment.create(author: @this_user, post: @this_post, text: 'Text2')
    Comment.create(author: @this_user, post: @this_post, text: 'Text3')
    Comment.create(author: @this_user, post: @this_post, text: 'Text4')
    Comment.create(author: @this_user, post: @this_post, text: 'Text5')
    Comment.create(author: @this_user, post: @this_post, text: 'Text6')
    Comment.create(author: @this_user, post: @this_post, text: 'Text7')
    Comment.create(author: @this_user, post: @this_post, text: 'Text8')
    Comment.create(author: @this_user, post: @this_post, text: 'Text9')
    Comment.create(author: @this_user, post: @this_post, text: 'Text10')
    expect(@this_post.recent_comments.length).to eq(5)
  end

  context 'Update posts counter' do
    before do
      Post.new(author: @this_user, title: 'new post', text: 'Lorem Ipsum etc', comments_counter: 0,
               likes_counter: 0)
    end
    it 'should add +1 to posts counter' do
      expect(@this_user.post_counter).to eq(2)
    end
  end
end
