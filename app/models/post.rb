class Post < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_many :comments, class_name: 'Comment', foreign_key: 'post_id'
  has_many :likes, class_name: 'Like', foreign_key: 'post_id'
  after_save :update_post_count

  def recent_comments
    comments.order(created_at: :desc).limit(5)
  end

  private

  def update_post_count
    author.increment!(:post_counter)
  end
end
