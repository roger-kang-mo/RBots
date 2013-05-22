class CreateUsers < ActiveRecord::Migration
  def change
  	create_table :users do |t|
  		t.string :name
  		t.boolean :likes_cats
  		t.boolean :likes_dogs
  		t.boolean :likes_sloths
  	end
  end
end
