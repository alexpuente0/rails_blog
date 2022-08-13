class User < ApplicationRecord
  has_many :comments, class_name: 'Comment', foreign_key: 'author_id'
  has_many :likes, class_name: 'Likes', foreign_key: 'author_id'
  has_many :posts, class_name: 'Post', foreign_key: 'author_id'

  validates :name, presence: true
  validates :post_counter, presence: true, numericality: { greater_than_or_equal_to: 0, only_integer: true }

  def recent_posts
    posts.order(created_at: :desc).limit(3)
  end
end
