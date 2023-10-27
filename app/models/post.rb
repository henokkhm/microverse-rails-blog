class Post < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: 'author_id'
  has_many :comments, foreign_key: 'post_id'
  has_many :likes, foreign_key: 'post_id'

  def self.last_five_comments(id)
    post = Post.find_by(id:)
    post.comments.order(created_at: :desc).limit(5)
  end
end
