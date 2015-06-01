class Fire < ActiveRecord::Base
	belongs_to :diver
	has_many :likes, dependent: :destroy
	has_many :fire_styles, dependent: :destroy	
	has_many :styles, through: :fire_styles
	has_many :fire_objectives, dependent: :destroy
	has_many :objectives, through: :fire_objectives

	validates :name, presence: true, length: {minimum: 5, maximum: 100}
	validates :summary, presence: true, length: {minimum: 10, maximum: 150}
	validates :description, presence: true, length: {minimum: 20, maximum: 500}
	validates :diver_id, presence: true
	mount_uploader :picture, PictureUploader
	validate :picture_size
	default_scope -> { order(created_at: :asc) }

	def thumbs_up_total
		self.likes.where(like: true).size
	end

	def thumbs_down_total
		self.likes.where(like: false).size
	end

	private

		def picture_size
			if picture.size > 5.megabytes
				errors.add(:picture, "should be less than 5MB")
			end
		end	
end