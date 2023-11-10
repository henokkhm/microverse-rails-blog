class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :posts, foreign_key: 'author_id'
  has_many :comments, foreign_key: 'user_id'
  has_many :likes, foreign_key: 'user_id'

  validates :name, presence: true
  validates :posts_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  before_validation :set_default_posts_counter

  def self.last_three_posts(id)
    user = User.find_by(id:)
    user.posts.order(created_at: :desc).limit(3)
  end

  private

  def set_default_posts_counter
    self.posts_counter ||= 0
  end
end
