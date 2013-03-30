class Comment < ActiveRecord::Base
	belongs_to :note
	belongs_to :user

	validates :text, presence: true
end
