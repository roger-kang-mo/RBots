class RenamePostsColumns < ActiveRecord::Migration
  def change
  	rename_column :posts, :updvotes, :up
  	rename_column :posts, :downvotes, :downs
  	rename_column :posts, :data, :body
  end
end
