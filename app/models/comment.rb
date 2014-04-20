# == Schema Information
#
# Table name: comments
#
#  id           :integer          not null, primary key
#  post_id      :integer          default(0), not null
#  author       :string(25)       default(""), not null
#  author_email :string(50)       default(""), not null
#  content      :text             default(""), not null
#  status       :string(25)       default(""), not null
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class Comment < ActiveRecord::Base
  attr_accessible :title, :body, :author, :content, :status, :post_id
  belongs_to :post

  before_save :check_count

  after_save :update_count

  def check_count
  	p = Post.find(self.post_id)
    puts "id #{p.id}"
  	puts "old size #{p.comments.size}"
  end

  def update_count
  	p = Post.find(self.post_id)  	
  	p.update_attributes(comments_count: p.comments.count)
    p.save  
    puts "new size #{p.comments.size}"	
  end

  def save_author(current_user)
    
    self.update_attributes(author: current_user.first_name)
    puts current_user.first_name
  end
end
