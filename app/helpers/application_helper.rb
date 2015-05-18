module ApplicationHelper
	def gravatar_for(diver, options = { size: 80 } )
		gravatar_id = Digest::MD5::hexdigest(diver.email.downcase)
		size = options[:size]
		gravatar_url = "http://secure.gravatar.com/avatare/#{gravatar_id}?s=#{size}"
		image_tag(gravatar_url, alt: diver.divername, class: "gravatar")
	end
end
