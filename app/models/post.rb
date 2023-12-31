class Post < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: 'author_id'
  has_many :comments, foreign_key: 'post_id'
  has_many :likes, foreign_key: 'post_id'

  after_save :update_posts_counter

  validates :title, presence: true, length: { maximum: 250 }
  validates :comments_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :likes_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  before_create :set_default_counters

  def self.last_five_comments(id)
    post = Post.find_by(id:)
    post.comments.order(created_at: :desc).limit(5)
  end

  private

  def update_posts_counter
    author.update(posts_counter: author.posts.count)
  end

  def set_default_counters
    self.likes_counter = 0
    self.comments_counter = 0
  end
end
