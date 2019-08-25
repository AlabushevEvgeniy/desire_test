class Post < ApplicationRecord
  belongs_to :authored_post, polymorphic: true
end
