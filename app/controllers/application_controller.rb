class ApplicationController < ActionController::Base

	layout 'application'
	# Prevent CSRF attacks by raising an exception.
	# For APIs, you may want to use :null_session instead.
	# protect_from_forgery

	def initialize
		@api ||= RedditAPI.new
		super
	end

	def check_logged_in
		unless session[:modhash]
			raise StandardError
		end
	end

	def get_bots 
		@bots = Bot.all
	end

end
