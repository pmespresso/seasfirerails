class Diver < ActiveRecord::Base
	has_many :fires
	has_many :likes
	before_save {self.email = email.downcase}
	validates :divername, presence: true, length: {minimum: 3, maximum: 40}
	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i
	validates :email, presence: true, length: {maximum: 110},
									  uniqueness: { case_sensitive: false },
									  format: {with: VALID_EMAIL_REGEX}
	has_secure_password
	has_attached_file :image, :styles => { :medium => "300x300#" }
	validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
end