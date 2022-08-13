require 'rails_helper'

RSpec.describe Like, type: :model do
  this_user = User.new(name: 'Ren', photo: 'photo_URL', bio: 'Test Dummy', post_counter: 0)
  this_post = Post.new(author: this_user, title: 'New post', text: 'Bla bla bla', comments_counter: 0, likes_counter: 1)
  like = Like.new(author: this_user, post: this_post)

  context 'Like Validation' do
    it 'Creates a like in a post' do
      expect(like).to be_valid
    end
  end

  context 'Like Save and Load' do
    it 'Saves a like and Loads it from database' do
      like.save
      expect(Like.find(like.id)).to be_an_instance_of(Like)
    end
  end
end
