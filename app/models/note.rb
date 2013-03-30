class Note < ActiveRecord::Base
	has_many :comments, dependent: :delete_all

	validates :name, presence: true, uniqueness: true
	validates :description, presence: true
	
	belongs_to :user

	scope :recent, lambda { |num = nil| order('created_at DESC').limit(num) }
end
