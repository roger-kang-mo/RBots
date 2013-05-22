class Post < ActiveRecord::Base

	attr_accessible :remote_id,
					:data,
					:subreddit,
					:time,
					:ups,
					:downs,
					:is_nsfw,
					:body

			
end