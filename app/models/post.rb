class Post < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_many :comments
  has_many :likes

  validates :likes_counter, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :comments_counter, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :title, presence: true, length: { maximum: 250 }

  def latest_comments
    comments.order(created_at: :desc).limit(5).reverse
  end

  def update_posts_counter(user_id)
    @user = User.find(user_id)
    counter = @user.posts.count
    @user.update(posts_counter: counter)
  end

  def update_comments_counter(post_id)
    @post = Post.find(post_id)
    counter = @post.comments.count
    @post.update(comments_counter: counter)
  end
end
