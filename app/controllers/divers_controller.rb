class DiversController < ApplicationController
	
	def index
		@divers = Diver.paginate(page: params[:page], per_page: 5)
	end

	def new
		@diver = Diver.new
	end

	def show
		@diver = Diver.find(params[:id])
		@fires = @diver.fires.paginate(page: params[:page], per_page: 3)
	end

	def create
		@diver = Diver.new(diver_params)
		if @diver.save
			flash[:success] = 'Your account has been created successfully'
			session[:diver_id] = @diver.id
			redirect_to fires_path
		else 
			render 'new'
		end
	end

	def edit
		@diver = Diver.find(params[:id])
	end

	def update
		@diver = Diver.find(params[:id])
		if @diver.update(diver_params)
			flash[:success] = 'Your profile has been successfully updated'
			redirect_to divers_path #TODO change to show diver page
		else
			render 'new'
		end
	end


	private

		def diver_params
			params.require(:diver).permit(:divername, :email, :image, :password)
		end
end