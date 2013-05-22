class RedditAPI
	include HTTParty

	attr_accessor 	:username,
					:password,
					:modhash


	BASE_URI = 'http://www.reddit.com'
	base_uri = 'http://www.reddit.com'
	USER_AGENT = "RBots v2013.5.7"

	def initialize

	end

	def login(data)
		# 👤
		self.username = data[:username]
		self.password = data[:password]
		
		# login_body = { :body => {:user => self.username, :passwd => self.password, :api_type => 'json' }, :headers => {"User-Agent" => USER_AGENT}}
		login_body = { :body => {:user => self.username, :passwd => self.password, :api_type => 'json' }}
		log_in = self.class.post("#{BASE_URI}/api/login/", login_body)
		
		# :) 
		# log_in = Hash.new
		# log_in = {
		#     "json" => {
		#         "errors" => [
		#             ["RATELIMIT", "you are doing that too much. try again in 1 hour.", "vdelay"]
		#         ]
		#     }
		# }

		ap log_in

		begin
			if log_in['json']['data']['modhash']
				self.modhash = log_in['json']['data']['modhash']
				# session[:modhash] = log_in['json']['data']['modhash']
			end
		rescue NoMethodError => e 

		end

		return log_in
	end

	def about_me
		ap user_data
		user_data
	end

	def logout
		self.modhash = nil
		session[:modhash] = nil
	end

	def get_user_data(username)
		# user_data = HTTParty.get("#{BASE_URI}/user/#{username}/about.json", :headers => {"User-Agent" => USER_AGENT })

		user_data = self.class.get("#{BASE_URI}/user/#{username}/about.json")
		user_data		
	end

	def get_user_comments(params)
		data = Helper.clean_params(params)
		username = data[:username]

		data.delete('username')

		query_data = { :query => data } 
		user_comments = self.class.get("#{BASE_URI}/user/#{username}/comments.json", query_data)
		user_comments	
	end

	def get_user_overview(username)
		user_overview = self.class.get("#{BASE_URI}/user/#{username}/overview.json")
		user_overview	
	end 

	def show_subreddit(params)
		# 👀
		data = Helper.clean_params(params)
		subreddit_name = data[:target] || 'new'

		data.delete(:target)

		query_data = { :query => data }

		subreddit_data = self.class.get("#{BASE_URI}/r/#{subreddit_name}.json", query_data)
		subreddit_data
	end
end
