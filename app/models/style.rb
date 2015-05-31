class Style < ActiveRecord::Base
	validates :name, presence: true, length: { minimum: 2, maximum: 25 }, uniqueness: { case_sensitive: false }
	has_many :fire_styles
	has_many :fires, through: :fire_styles
end