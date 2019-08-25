class ReadPost < ApplicationRecord
	belongs_to :read_item, polymorphic: true
end
