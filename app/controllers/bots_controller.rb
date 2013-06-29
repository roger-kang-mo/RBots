require 'RedditAPI'
require 'RedditAccount'
require 'Helper'
require 'bots/Bot'

class BotsController < ApplicationController

	def create 
		new_bot = Bot.new

		bot_attributes = Helper.clean_attributes(Bot, params)
		if Bot.find_by_name(bot_attributes['name'])
			@response_data = { 'message' => 'Bot by that name already exists' }
		else
			begin
				@api.create_reddit_account(params)
				new_bot.update_attributes(bot_attributes)
				new_bot.save
			rescue(:StandardError => e)
				@response_data = { 'message' => 'Error Creating Account', e }
			end
		end

		respond_to do |format|
			render :action => 'show_bots'
		end
	end

	def get_comments
		@current_bot.get_comments(params)
		
	end

	def show_bots
		@bots = Bot.all

		respond_to do |format|
			format.js { render :template => 'bots/show_bots.js.coffee' }
		end
	end

end