class CreateBlogs < ActiveRecord::Migration[5.2]
  def change
    create_table :blogs do |t|
    	t.integer :user_id, null: false
    	t.string :title, null: false
    	t.text :introduction, null: false
    	t.text :image_id
    	t.timestamps
    end
  end
end
