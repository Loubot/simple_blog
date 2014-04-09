class CreateCommentsCounterWithAutoUpdate < ActiveRecord::Migration
  def up
  	change_table(:blog_posts) do |t|
  		t.integer :comments_count, :limit => 4, :default => 0, :null => false
  	end  	
  end

  def down
  	remove_column :blog_posts, :comments_count
  end
end
