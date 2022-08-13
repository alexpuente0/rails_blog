class Post < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_many :comments, class_name: 'Comment', foreign_key: 'post_id'
  has_many :likes, class_name: 'Like', foreign_key: 'post_id'
  after_save :update_post_count

  validates :title, presence: true, length: { maximum: 250 }
  validates :comments_counter, presence: true, numericality: { greater_than_or_equal_to: 0, only_integer: true }
  validates :likes_counter, presence: true, numericality: { greater_than_or_equal_to: 0, only_integer: true }

  def recent_comments
    comments.order(created_at: :desc).limit(5)
  end

  private

  def update_post_count
    author.increment!(:post_counter)
  end
end
