class CreateRecipes < ActiveRecord::Migration
  def change
  	create_table :recipes do |t|
  		t.string :title, null: false
  		t.string :directions, array: true, null: false
  		t.string :ingredients, array: true, null: false 
  		t.integer :user_id, null: false

  		t.timestamps null: false 
  	end
  end
end
