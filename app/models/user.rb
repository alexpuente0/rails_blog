class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable

  after_create :generate_api_token

  has_many :comments, class_name: 'Comment', foreign_key: 'author_id', dependent: :delete_all
  has_many :likes, class_name: 'Likes', foreign_key: 'author_id', dependent: :delete_all
  has_many :posts, class_name: 'Post', foreign_key: 'author_id', dependent: :delete_all

  validates :name, presence: true
  validates :post_counter, presence: true, numericality: { greater_than_or_equal_to: 0, only_integer: true }

  def recent_posts
    posts.order(created_at: :desc).limit(3)
  end

  private

  def generate_api_token
    self.api_token = Devise.friendly_token
    save
  end
end
