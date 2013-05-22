class User < ActiveRecord::Base

	attr_accessible :name,
					:likes_cats,
					:likes_dogs,
					:likes_sloths

	has_many :bot
	has_one :reddit_account

end