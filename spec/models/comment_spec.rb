require 'rails_helper'

RSpec.describe Comment, type: :model do
  subject(:this_user) { User.create(name: 'Lou', photo: 'photo_URL', bio: 'Test Dummy', post_counter: 0) }
  subject(:this_post) do
    Post.create(author: this_user, title: 'new post', text: 'Lorem Ipsum etc.', comments_counter: 0,
                likes_counter: 0)
  end
  subject(:comment) { Comment.create(author: this_user, post: this_post, text: 'New Comment Who Dis') }

  after(:all) do
    Comment.destroy_all
    Post.destroy_all
    User.destroy_all
  end

  it 'creates a comment when valid' do
    expect(comment).to be_valid
  end

  it 'Saves comment and loads it from database' do
    expect(comment).to be_an_instance_of(Comment)
  end

  before do
    this_post.comments.create(author: this_user, post: this_post, text: 'New comment #1')
    this_post.comments.create(author: this_user, post: this_post, text: 'New comment #2')
  end
  it 'should add +1 to comment counter' do
    expect(this_post.comments_counter).to eq(2)
  end
end
