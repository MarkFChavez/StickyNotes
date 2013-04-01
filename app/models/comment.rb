class Comment < ActiveRecord::Base

	after_save :send_email_to_user

	#associations
	belongs_to :note
	belongs_to :user

	#validations
	validates :text, presence: true

	def send_email_to_user
		if self.user != self.note.user
			Notification.send_email_to_user(self.note.user, self.user).deliver
		end
	end
	
end