class Comment < ActiveRecord::Base
	belongs_to :note
	belongs_to :user

	validates :text, presence: true
	#validates :comment_by, presence: true
end
