# == Schema Information
#
# Table name: blog_posts
#
#  id             :integer          not null, primary key
#  title          :string(100)      default(""), not null
#  content        :text(100)        default(""), not null
#  author_id      :integer          default(0), not null
#  status         :string(20)       default(""), not null
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  comments_count :integer          default(0), not null
#

class Post < ActiveRecord::Base

	set_table_name 'blog_posts'
  attr_accessible :title, :body, :status, :content, :author_id, :comments_count

  belongs_to :author, :class_name => 'User', :foreign_key => 'author_id'

  has_many :comments, :order => 'created_at ASC', :dependent => :destroy

  has_many :categorisations

  has_many :categories, :through => :categorisations

  
end
