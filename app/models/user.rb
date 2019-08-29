class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, #:registerable,
         :jwt_authenticatable,
         jwt_revocation_strategy: JWTBlacklist
         # :recoverable, :rememberable, :validatable
  has_many :posts
  has_many :favorites
  has_many :favorite_posts, through: :favorites, source: :post
  has_many :read_posts
  has_many :looked_posts, through: :read_posts, source: :post
end
