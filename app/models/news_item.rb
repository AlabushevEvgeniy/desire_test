class NewsItem < ApplicationRecord
  belongs_to :user
  has_many :favorite_items
  has_many :read_news_items
end
