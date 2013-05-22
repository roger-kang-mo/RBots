class AddGoldModToRedditAccount < ActiveRecord::Migration
  def change
  	add_column :reddit_accounts, :is_mod, :boolean
  	add_column :reddit_accounts, :is_gold, :boolean
  end
end
