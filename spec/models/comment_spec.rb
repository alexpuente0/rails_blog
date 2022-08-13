require 'rails_helper'

RSpec.describe Comment, type: :model do
  this_user = User.new(name: 'Lou', photo: 'photo_URL', bio: 'Test Dummy', post_counter: 0)
  this_post = Post.new(author: this_user, title: 'new post', text: 'Lorem Ipsum etc.', comments_counter: 0,
                       likes_counter: 0)
  comment = Comment.new(author: this_user, post: this_post, text: 'New Comment Who Dis')

  before do
    this_user.save
    this_post.save
    comment.save
  end

  context 'Comment Validation' do
    it 'creates a comment when valid' do
      expect(comment).to be_valid
    end
  end

  context 'Save and Load Comment' do
    it 'Saves comment and loads it from database' do
      expect(comment).to be_an_instance_of(Comment)
    end
  end

  context 'Update comment counter' do
    before do
      Comment.new(author: this_user, post: this_post, text: 'Another Comment')
    end
    it 'should add +1 to comment counter' do
      expect(this_post.comments_counter).to eq(3)
    end
  end
end
