class CreatePost < ActiveRecord::Migration
  def change
    create_table :posts do |t|
    	t.string :remote_id
    	t.text :data
    	t.string :subreddit
    	t.string :time
    	t.integer :updvotes
    	t.integer :downvotes
    	t.boolean :is_nsfw
    end
  end
end
