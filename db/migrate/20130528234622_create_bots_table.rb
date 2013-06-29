class CreateBotsTable < ActiveRecord::Migration
	def change
		create_table :bots do |t|
			t.string :name
			t.string :type
			t.integer :post_count
			t.integer :message_count
		end
	end
end
