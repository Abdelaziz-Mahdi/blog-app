class Post < ApplicationRecord
  after_create :update_posts_counter
  after_destroy :update_posts_counter
  belongs_to :author, class_name: 'User', foreign_key: 'author_id'
  has_many :comments, foreign_key: 'post_id', dependent: :destroy
  has_many :likes, foreign_key: 'post_id', dependent: :destroy

  validates :title, presence: true, length: { maximum: 250 }
  validates :comments_counter, numericality: { greater_than_or_equal_to: 0 }
  validates :likes_counter, numericality: { greater_than_or_equal_to: 0 }

  paginates_per 3 # kaminari pagination

  def update_posts_counter
    author.update(posts_counter: author.posts.count)
  end

  def last_five_comments
    comments.order(created_at: :desc).limit(5)
  end
end
