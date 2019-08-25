class FavoriteNewsItem < ApplicationRecord
  belongs_to :user
  belongs_to :news_item
end
