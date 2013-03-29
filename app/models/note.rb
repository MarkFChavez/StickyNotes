class Note < ActiveRecord::Base
	has_many :comments, dependent: :destroy
	#before_save :nl2br

	validates :name, presence: true, uniqueness: true
	validates :description, presence: true
	validates :noted_by, presence: true

	def nl2br
		self.description.gsub!(/\n/, "<br />")
	end
end
