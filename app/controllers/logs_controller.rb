class LogsController < ApplicationController

	def index 
		@log = Log.all
	end

	def new
	end

	def create
		@log = Log.new(post_params)
		@log.save
			redirect_to @log
	end

	def show
		@log = Log.find(params[:id])
	end

	private

	def post_params
		params.require(:log).permit(:title, :entry, :place, :date, :rating)
	end
end