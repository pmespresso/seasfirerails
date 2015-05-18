class FiresController < ApplicationController

	def index 
		@fires = Fire.all.order("created_at DESC")
	end

	def show
		@fire = Fire.find(params[:id])
	end

	def new
		@fire = Fire.new
	end
end