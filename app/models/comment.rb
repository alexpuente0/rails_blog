class Comment < ApplicationRecord
  belongs_to :author, class_name: 'User'
  belongs_to :post, class_name: 'Post'
  after_create :update_comment_count
end

def update_comment_count
  post.increment!(:comments_counter)
end
