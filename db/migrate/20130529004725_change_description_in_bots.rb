class ChangeDescriptionInBots < ActiveRecord::Migration
  def change
  	change_column :bots, :description, :text
  end
end
