class CreateCalculations < ActiveRecord::Migration[5.2]
  	def change
    	create_table :calculations do |t|
    	t.integer :displacement, null: false
    	t.integer :weight, null: false
    	t.integer :distance, null: false
    	t.integer :gasoline, null: false
    	t.float :consumption, null: false
    	t.integer :insurance, null: false
    	t.integer :inspection, null: false
    	t.integer :parking, null: false
    	t.integer :price, null: false
      	t.timestamps
    	end
  	end
end
