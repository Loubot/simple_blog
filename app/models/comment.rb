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
  # attr_accessible :title, :body
end
