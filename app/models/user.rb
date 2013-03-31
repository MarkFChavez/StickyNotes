class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me

  has_many :notes, dependent: :delete_all
  has_many :comments, through: :notes

  default_scope order('created_at DESC')

  scope :normal_users, where(is_admin: false)
  scope :administrators, where(is_admin: true)
end