class Like < ActiveRecord::Base
	belongs_to :diver
	belongs_to :fire

	validates_uniqueness_of :diver, scope: :fire
end
