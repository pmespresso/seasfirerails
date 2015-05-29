class FiresController < ApplicationController
	before_action :set_fire, only: [:edit, :update, :show, :like]
	before_action :require_user, except: [:show, :index]
	before_action :require_same_user, only: [:edit, :update]

	def index 
		@fires = Fire.paginate(page: params[:page], per_page: 5)
	end

	def show
	end

	def new
		@fire = Fire.new
	end

	def create
		@fire = Fire.new(fire_params)
		@fire.diver = current_user

		if @fire.save
			flash[:success] = "Your Fire was created successfully"
			redirect_to fires_path
		else
			flash[:success] = "Your Fire failed to successfully post"
			render :new
		end
	end

	def edit
	end

	def update
		if @fire.update(fire_params)
			flash[:success] = "Successfully updated your Fire!"
			redirect_to fire_path(@fire)
		else
			render :edit
		end
	end

	def like
		
		like = Like.create(like: params[:like], diver: current_user, fire: @fire)
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

		def set_fire
			@fire = Fire.find(params[:id])
		end

		def require_same_user
			if current_user != @fire.diver
				flash[:danger] = "You can only edit when logged in"
				redirect_to root_path
			end
		end
end