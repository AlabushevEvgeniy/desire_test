class User < ApplicationRecord
  has_many :posts, as: :authored_posts
  has_many :favorites, as: :favorite_posts
  has_many :read_posts, as: :read_items

  validates :full_name, presence: true

end
