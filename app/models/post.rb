# == Schema Information
#
# Table name: blog_posts
#
#  id         :integer          not null, primary key
#  title      :string(100)      default(""), not null
#  body       :text             default(""), not null
#  author_id  :string(100)      default("0"), not null
#  category   :string(20)       default(""), not null
#  status     :string(20)       default(""), not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  content    :string(100)      default(""), not null
#

class Post < ActiveRecord::Base

	set_table_name 'blog_posts'
  # attr_accessible :title, :body

  belongs_to :author, :class_name => 'User', :foreign_key => 'author_id'

  has_many :comments, :order => 'created_at ASC', :dependent => :destroy
end
