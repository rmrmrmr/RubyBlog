class Post < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_many :comments
  has_many :likes

  def latest_comments
    comments.order(created_at: :desc).limit(5).reverse
  end

  def update_posts_counter
    author.increment!(:posts_counter)
  end

  after_save :update_posts_counter
end
