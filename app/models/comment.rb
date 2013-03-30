class Comment < ActiveRecord::Base

	#associations
	belongs_to :note
	belongs_to :user

	#validations
	validates :text, presence: true
	
end
