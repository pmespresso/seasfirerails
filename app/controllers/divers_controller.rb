class DiversController < ActiveRecord::Base

	def index
		@diver = Diver.all
	end

	def new
		@diver = Diver.new
	end

	def create
		@diver = Diver.new(diver_params)
		@diver.save
			redirect_to @diver
	end

	def show
		@diver = Diver.find(diver_params[:id])
	end

	private

	def diver_params
		params.require(:diver).permit(:divername, :email)
	end
end