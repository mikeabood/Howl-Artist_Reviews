class Artist < ActiveRecord::Base
	self.table_name = "artists"

	has_many :comments

end