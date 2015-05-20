class FiresController < ApplicationController

	def index 
		@fires = Fire.all
	end

	def show
		@fire = Fire.find(params[:id])
	end

	def new
		@fire = Fire.new
	end

	def create
		@fire = Fire.new(fire_params)
		@fire.diver = Diver.find(1)

		if @fire.save
			flash[:success] = "Your Fire was created successfully"
			redirect_to fires_path
		else
			render :new
		end
	end



	private

		def fire_params
			params.require(:fire).permit(:name, :summary, :description)
		end
end