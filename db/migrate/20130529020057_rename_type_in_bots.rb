class RenameTypeInBots < ActiveRecord::Migration
  def change
  	rename_column :bots, :type, :bot_type
  end
end
