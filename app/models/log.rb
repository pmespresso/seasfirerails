class Log < ActiveRecord::Base
	validates :title, presence: true, length:{minimum: 5}
	validates :entry, presence: true
	belongs_to :user
end