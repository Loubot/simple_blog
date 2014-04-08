class AddContentToBlogPosts < ActiveRecord::Migration
  def change
  	change_table :blog_posts do |t|
  		t.string :content, :limit => 100, :default => "", :null => false
  	end 
  end
end
