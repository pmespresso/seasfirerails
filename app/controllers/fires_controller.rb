class FiresController < ApplicationController

	def index 
		@fires = Fire.paginate(page: params[:page], per_page: 5)
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
			flash[:success] = "Your Fire failed to successfully post"
			render :new
		end
	end

	def edit
		@fire = Fire.find(params[:id])
	end

	def update
		@fire = Fire.find(params[:id])
		if @fire.update(fire_params)
			flash[:success] = "Successfully updated your Fire!"
			redirect_to fire_path(@fire)
		else
			render :edit
		end
	end

	def like
		@fire = Fire.find(params[:id])
		like = Like.create(like: params[:like], diver: Diver.first, fire: @fire)
		if like.valid?
			flash[:success] = "Liked!"
			redirect_to :back
		else
			flash[:danger] = "You already voted on this Fire!"
			redirect_to :back
		end
	end

	private

		def fire_params
			params.require(:fire).permit(:name, :summary, :description, :picture)
		end
end