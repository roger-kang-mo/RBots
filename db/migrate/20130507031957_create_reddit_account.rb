class CreateRedditAccount < ActiveRecord::Migration
  def change
    create_table :reddit_accounts do |t|
    	t.string :remote_id
    	t.string :name
    	t.integer :comment_karma
    	t.integer :link_karma
    	t.timestamp :created
    end
  end
end
