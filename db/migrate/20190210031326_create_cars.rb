class CreateCars < ActiveRecord::Migration[5.2]
  def change
    create_table :cars do |t|
    	t.integer :user_id, null: false
    	t.integer :maker, null: false
    	t.string :car_model, null: false
    	t.string :model_code
    	t.string :body_type
    	t.string :grade
    	t.integer :color
    	t.text :introduction, null: false
    	t.string :image_id
      	t.timestamps
    end
  end
end
