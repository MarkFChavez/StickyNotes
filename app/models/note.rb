class Note < ActiveRecord::Base

	after_create :send_notif

	#associations
	has_many :comments, dependent: :delete_all
	belongs_to :user

	#validations
	validates :name, presence: true, uniqueness: true
	validates :description, presence: true
	
	#scopes
	scope :recent, lambda { |num=nil| order('created_at DESC').limit(num) }
	scope :public, where(public: true)
	scope :private, where(public: false)

	def send_notif
		User.find_each do |user|
			Notification.send_notif(user).deliver
		end
	end
	
end
