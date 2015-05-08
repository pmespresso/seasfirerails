class FiresController < ApplicationController

	def index 
		@fire = Fire.all
	end

	def new
	end

	def create
		@fire = Fire.new(post_params)
		@fire.save
			redirect_to @fire
	end

	def show
		@fire = Fire.find(params[:id])
	end

	private

	def post_params
		params.require(:fire).permit(:title, :entry, :place, :date, :rating)
	end
end