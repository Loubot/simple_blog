# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  username               :string(25)       default(""), not null
#  hashed_password        :string(40)       default(""), not null
#  first_name             :string(25)       default(""), not null
#  last_name              :string(40)       default(""), not null
#  email                  :string(50)       default(""), not null
#  display_name           :string(25)       default(""), not null
#  user_level             :integer          default(0), not null
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  encrypted_password     :string(255)      default(""), not null
#  reset_password_token   :string(255)
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string(255)
#  last_sign_in_ip        :string(255)
#

class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :authentication_keys => [:login]

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me
  attr_accessible :username, :first_name, :last_name, :email, :display_name, :hashed_password, :user_level 
  has_many :posts, :foreign_key => 'author_id', :dependent => :destroy

  attr_accessor :login
  attr_accessible :login

  validates_presence_of :username, :email, :password, :password_confirmation, :first_name, :last_name, :display_name

  validates :username,:uniqueness => { :case_sensitive => false }

  has_many :recent_posts, :class_name => 'Post', :foreign_key => 'author_id',:order => 'created_at ASC', :limit => 5


  def full_name
  	"#{self.first_name} #{self.last_name}"
  end

  def self.find_first_by_auth_conditions(warden_conditions)
    conditions = warden_conditions.dup
    if login = conditions.delete(:login)
      where(conditions).where(["lower(username) = :value OR lower(email) = :value", { :value => login.downcase }]).first
    else
      where(conditions).first
    end
  end
end

#https://github.com/plataformatec/devise/wiki/How-To:-Allow-users-to-sign-in-using-their-username-or-email-address
