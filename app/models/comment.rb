class Comment < ActiveRecord::Base
	belongs_to :note

	validates :text, presence: true
	#validates :comment_by, presence: true
end
