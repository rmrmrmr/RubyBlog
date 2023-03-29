class User < ApplicationRecord
  has_many :posts, foreign_key: 'author_id'
  has_many :comments
  has_many :likes

  def latest_posts
    posts.order(created_at: :desc).limit(3).reverse
  end
end
