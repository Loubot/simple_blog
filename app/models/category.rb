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

	has_many :categorisations
  has_many :posts :through => :categorisations
end
