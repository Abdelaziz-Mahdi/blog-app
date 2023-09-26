class User < ApplicationRecord
  has_many :posts, dependent: :destroy, foreign_key: 'author_id'
  has_many :likes, dependent: :destroy, foreign_key: 'user_id'
  has_many :comments, dependent: :destroy, foreign_key: 'user_id'
end
