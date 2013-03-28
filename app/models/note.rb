class Note < ActiveRecord::Base
	has_many :comments
	before_save :nl2br

	validates :name, presence: true
	validates :description, presence: true
	validates :noted_by, presence: true

	def nl2br
		self.description.html_safe.gsub!(/\n/, "<br />")
	end
end
