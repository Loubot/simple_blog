# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  username        :string(25)       default(""), not null
#  hashed_password :string(40)       default(""), not null
#  first_name      :string(25)       default(""), not null
#  last_name       :string(40)       default(""), not null
#  email           :string(50)       default(""), not null
#  display_name    :string(25)       default(""), not null
#  user_level      :integer          default(0), not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class User < ActiveRecord::Base
  attr_accessible :username, :first_name, :last_name, :email, :display_name, 
end
