class Comment < ActiveRecord::Base

	self.table_name = "comments"

	belongs_to :user 
	belongs_to :artist
end