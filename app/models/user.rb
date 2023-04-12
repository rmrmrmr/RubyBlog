class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable
  has_many :posts, dependent: :destroy, foreign_key: 'author_id'
  has_many :comments
  has_many :likes

  validates :name, presence: true
  validates :posts_counter, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  # rubocop:disable Naming/ConstantName
  Roles = [:admin, :default]
  # rubocop:enable Naming/ConstantName

  def admin?
    self.role == 'admin'
  end

  def latest_posts
    posts.order(created_at: :desc).limit(3).reverse
  end
end
