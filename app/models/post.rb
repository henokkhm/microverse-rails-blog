class Post < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: 'author_id'
  has_many :comments, foreign_key: 'post_id'
  has_many :likes, foreign_key: 'post_id'

  after_save :update_posts_counter

  validates :title, presence: true

  def self.last_five_comments(id)
    post = Post.find_by(id:)
    post.comments.order(created_at: :desc).limit(5)
  end

  private

  def update_posts_counter
    user.update(posts_counter: user.posts.count)
  end
end
