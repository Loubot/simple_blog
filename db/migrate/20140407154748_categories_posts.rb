class CategoriesPosts < ActiveRecord::Migration
  def change
  	create_table :categories_posts, :id => false do |t|
  		t.integer :category_id, :null => false
  		t.integer :post_id, :null => false
  	end

  	add_index :categories_posts, :category_id
  	add_index :categories_posts, :post_id
  	#remove_column :blog_posts, :category
  end
end
