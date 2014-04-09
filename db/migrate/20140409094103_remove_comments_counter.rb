class RemoveCommentsCounter < ActiveRecord::Migration
  def up
  	remove_column :blog_posts, :comments_count
  end

  def down
  	add_column :blog_posts, :comments_count, :integer, :limit => 4, :default => 0, :null => false
  end
end
