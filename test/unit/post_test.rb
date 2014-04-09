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

require 'test_helper'

class PostTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
