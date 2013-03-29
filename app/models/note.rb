class Note < ActiveRecord::Base
	has_many :comments, dependent: :delete_all
	#before_save :nl2br

	validates :name, presence: true, uniqueness: true
	validates :description, presence: true
	#validates :noted_by, presence: true

	belongs_to :user
end
