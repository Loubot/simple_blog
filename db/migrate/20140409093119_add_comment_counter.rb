class AddCommentCounter < ActiveRecord::Migration
  def change
  	change_table :blog_posts do |t|
  		t.integer :comments_count, :limit => 4, :default => 0, :null => false
  	end
  end
end
