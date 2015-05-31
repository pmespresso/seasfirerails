class Objective < ActiveRecord::Base
	validates :name, presence: true, length: { minimum: 2, maximum: 25 }
	has_many :fire_objectives
	has_many :fires, through: :fire_objectives
end