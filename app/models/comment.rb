class Comment < ApplicationRecord
  after_create :update_comments_counter
  after_destroy :update_comments_counter

  belongs_to :author, class_name: 'User', foreign_key: 'user_id'
  belongs_to :post

  validates :text, presence: true

  def update_comments_counter
    post.update(comments_counter: post.comments.count)
  end
end
