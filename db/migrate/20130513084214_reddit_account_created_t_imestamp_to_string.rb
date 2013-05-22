class RedditAccountCreatedTImestampToString < ActiveRecord::Migration
  def change
  	change_column :reddit_accounts, :created, :string
  end
end
