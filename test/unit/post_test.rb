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

require 'test_helper'

class PostTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
