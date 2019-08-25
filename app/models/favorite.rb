class Favorite < ApplicationRecord
  belongs_to :favorite_post, polymorphic: true
end
