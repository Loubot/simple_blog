class ChangeAuthorToAuthorId < ActiveRecord::Migration
  def up
  	rename_column :blog_posts, :author, :author_id
  end

  def down
  	rename_column :blog_posts, :author_id, :author
  end
end
