class Fire < ActiveRecord::Base
	belongs_to :diver
	validates :name, presence: true, length: {minimum: 5, maximum: 100}
	validates :summary, presence: true, length: {minimum: 10, maximum: 150}
	validates :description, presence: true, length: {minimum: 20, maximum: 500}
	validates :diver_id, presence: true
end