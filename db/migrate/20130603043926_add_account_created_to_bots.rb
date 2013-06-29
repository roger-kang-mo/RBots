class AddAccountCreatedToBots < ActiveRecord::Migration
  def change
  	add_column :bots, :account_created, :boolean
  end
end
