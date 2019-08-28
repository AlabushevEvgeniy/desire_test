models
class User < ApplicationRecord
  has_many :posts
  has_many :favorites
  has_many :favorite_posts, through: :favorites, source: :post
  has_many :read_posts
  has_many :looked_posts, through: :read_posts, source: :post
end
