require 'RedditAPI'
require 'RedditAccount'
require 'Helper'
require 'bots/Bot'

class UsersController < ApplicationController

  before_filter :check_logged_in, :only => [:about_me]
  before_filter :get_bots, :only => [:index]

  def index
    respond_to do |format|
      format.html
    end
  end

  def new
  end

  def show
  	redirect_to :index
  end

  def create
  end

  def update
  end

  def destroy
  end

  def about_me
    @response_data = @api.about_me

    respond_to do |format|
      format.js { render :template => 'layouts/display_hash.js.coffee'}
    end
  end

  def login_to_reddit
  	@response_data = @api.login(params)

    session[:modhash] = @api.modhash if @api.modhash

    respond_to do |format|
      format.js { render :template => '/layouts/display_hash.js.coffee' }
    end
  end

  def get_account_info
  	@response_data = @api.get_user_data(params[:username]) 

    if @response_data['error'] and @response_data['error'] == 404
      @response_data['error'] = 'User not found'
    else
      if RedditAccount.find_all_by_remote_id(@response_data['data']['id']).length == 0 
        new_user = RedditAccount.new
        new_user.update_attributes(Helper.clean_attributes(RedditAccount, @response_data['data']))
        new_user.save
      end
    end

  	respond_to do |format|
      format.js { render :template => '/layouts/display_hash.js.coffee' }
    end
  end

  def show_subreddit
    @response_data = @api.show_subreddit(params)

    respond_to do |format|
      format.js { render :template => '/layouts/display_hash.js.coffee' }
    end
  end

  def get_user_comments
    @response_data = @api.get_user_comments(params)

    posts = @response_data['data']['children']

    posts.each do |post|
      post_data = post['data']
      if Post.find_by_remote_id(post_data['id']) == nil
        new_post = Post.new
        new_post.update_attributes(Helper.clean_attributes(Post, post_data))
        new_post.save
      end
    end

    respond_to do |format|
      format.js { render :template => '/layouts/display_hash.js.coffee' }
    end
  end

  def get_user_overview
    @response_data = @api.get_user_overview(params[:username])

    respond_to do |format|
      format.js { render :template => '/layouts/display_hash.js.coffee' }
    end
  end

  def bulk_collect_user_data
  
  end

  def clear_session
    @api.logout
    @api = RedditAPI.new
  end

end
