class AddDescriptionToBots < ActiveRecord::Migration
  def change
  	add_column :bots, :description, :string
  end
end
