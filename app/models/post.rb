class Post < ApplicationRecord
  belongs_to :user
  has_many :favorites
  has_many :faved_users, through: :favorites, source: :user
  has_many :read_posts
  has_many :read_by_users, through: :read_posts, source: :user

  validates :title, :preview, :text, presence: true
  validates :published, inclusion: { in: [true, false] }
end
