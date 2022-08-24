require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @this_user = User.new(name: 'Luke', photo: 'photo_URL', bio: 'Test Dummy', post_counter: 4)
    @this_user.save
  end

  after(:all) do
    Like.destroy_all
    Comment.destroy_all
    Post.destroy_all
    User.destroy_all
  end

  context 'User Validation' do
    it 'Confirms Valid user' do
      expect(@this_user).to be_valid
    end
    it 'Deny user with no name' do
      @this_user.name = ''
      expect(@this_user).not_to be_valid
    end
    it 'Deny user with post count as string' do
      @this_user.post_counter = 'eight'
      expect(@this_user).not_to be_valid
    end
    it 'Deny user with negative post count' do
      @this_user.post_counter = -1
      expect(@this_user).not_to be_valid
    end
  end

  context 'Save and Load Validated User' do
    it 'Save user and Loads from Database' do
      @this_user.save
      expect(User.find(@this_user.id)).to be_an_instance_of(User)
    end
  end

  context 'Invalid user cant be Saved so cant be Loaded' do
    it 'Invalid user not saved to database' do
      @this_user.post_counter = 'eight'
      expect(@this_user.save).to eq false
    end
  end

  it 'Loads recent posts from Valid User' do
    @this_user.post_counter = 0
    @this_user.save
    Post.create(author: @this_user, title: 'Title1', text: 'Text1', comments_counter: 0, likes_counter: 0)
    Post.create(author: @this_user, title: 'Title2', text: 'Text2', comments_counter: 0, likes_counter: 0)
    Post.create(author: @this_user, title: 'Title3', text: 'Text3', comments_counter: 0, likes_counter: 0)
    Post.create(author: @this_user, title: 'Title4', text: 'Text4', comments_counter: 0, likes_counter: 0)
    expect(@this_user.post_counter).to eq(4)
  end
end
