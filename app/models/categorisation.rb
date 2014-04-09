# == Schema Information
#
# Table name: categories_posts
#
#  category_id :integer          not null
#  post_id     :integer          not null
#  id          :integer          not null, primary key
#

class Categorisation < ActiveRecord::Base

	set_table_name 'categories_posts'
  belongs_to :category
  belongs_to :post
end
