class FireObjective < ActiveRecord::Base
	belongs_to :objective
	belongs_to :fire
end