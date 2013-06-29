require 'RedditAPI'

class Bot < ActiveRecord::Base

	attr_accessible :name, 
					:bot_type,
					:post_count,
					:message_count,
					:description,
					:account_created

	# attr_default	:account_created, false
	# attr_default	:post_count, 0
	# attr_default	:message_count, 0

	belongs_to :user

	def initialize 
		super
	end

	def compose_message
		friendly_message = "Hi there, this is your friendly, neighborhood bot reminding you that..."
	end

	def get_comments(params)
		results = @api.get_comments(params)


	end

	def parse_results_for(which, data)
		types = { 't1' => which['message'], 't2' => which['post'], 't3' => which['comment']}
		things = data['data'].dup

		things.each do |thing|
			unless thing['kind']
				things.delete(thing)
			end
		end

		things
	end


end