require 'rails_helper'

RSpec.describe User, type: :model do

  user_valid = User.new(name: 'Luke', photo: 'photo_URL', bio: 'Test Dummy', post_counter: 4)
  user_invalid_name = User.new(name: nil, photo: 'photo_URL', bio: 'Test Dummy', post_counter: 1)
  user_invalid_post = User.new(name: 'Han', photo: 'photo_URL', bio: 'Test Dummy', post_counter: 'four')
  user_invalid_post_counter = User.new(name: 'Rei', photo: 'photo_URL', bio: 'Test Dummy', post_counter: -1)

  context 'User Validation' do
    it 'Confirms Valid user' do
      expect(user_valid).to be_valid
    end
    it 'Deny user with no name' do
      expect(user_invalid_name).not_to be_valid
    end
    it 'Deny user with post count as string' do
      expect(user_invalid_post).not_to be_valid
    end
    it 'Deny user with negative post count' do
      expect(user_invalid_post_counter).not_to be_valid
    end
  end

  context 'Save and Load Validated User' do
    it 'Save user and Loads from Database' do
      user_valid.save
      expect(User.find(user_valid.id)).to be_an_instance_of(User)
    end
  end

  context 'Invalid user cant be Saved so cant be Loaded' do
    it 'Invalid user not saved to database' do
      expect(user_invalid_name.save).to eq false
    end
  end

  context 'Loads recent posts from Valid User' do
    user = User.first
    it 'Returns the expected data type' do
      recent = user.recent_posts
      expect(recent.length).to be_a_kind_of(Integer)
    end
  end
end