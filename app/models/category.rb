# == Schema Information
#
# Table name: categories
#
#  id          :integer          not null, primary key
#  name        :string(50)       default(""), not null
#  short_name  :string(30)       default(""), not null
#  description :string(255)      default(""), not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Category < ActiveRecord::Base
  # attr_accessible :title, :body
end
