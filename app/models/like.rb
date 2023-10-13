class Like < ApplicationRecord
  after_create :update_likes_counter
  after_destroy :update_likes_counter

  belongs_to :author, class_name: 'User', foreign_key: 'user_id'
  belongs_to :post

  # prevent multiple likes by same user on same post
  validates :author, uniqueness: { scope: :post, message: "You can't like a post more than once" }

  def update_likes_counter
    post.update(likes_counter: post.likes.count)
  end
end
