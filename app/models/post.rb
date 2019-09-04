class Post < ApplicationRecord
  belongs_to :user
  has_many :favorites
  has_many :faved_users, through: :favorites, source: :user
  has_many :read_posts
  has_many :read_by_users, through: :read_posts, source: :user

  validates :title, :preview, :text, presence: true
  validates :published, inclusion: { in: [true, false] }

  def self.unread_for_user(user)
    read_posts = ReadPost.where(user: user.id).map(&:post)
    alien_posts = Post.all - Post.where(user_id: user.id)
    unread = alien_posts - read_posts
  end
end
