class DiversController < ApplicationController
	before_action :set_diver, only: [:edit, :update, :show]
	before_action :require_same_user, only: [:edit, :update]

	def index
		@divers = Diver.paginate(page: params[:page], per_page: 5)
	end

	def new
		@diver = Diver.new
	end

	def show
		@fires = @diver.fires.paginate(page: params[:page], per_page: 3)
	end

	def create
		@diver = Diver.new(diver_params)
		if @diver.save
			flash[:success] = 'Your account has been created successfully'
			session[:diver_id] = @diver.id
			redirect_to diver_path(@diver)
		else 
			render 'new'
		end
	end

	def edit
		
	end

	def update
		if @diver.update(diver_params)
			flash[:success] = 'Your profile has been successfully updated'
			redirect_to diver_path(diver) 
		else
			render 'new'
		end
	end


	private

		def diver_params
			params.require(:diver).permit(:divername, :email, :image, :password)
		end

		def set_diver
			@diver = Diver.find(params[:id])
		end

		def require_same_user
			if current_user != @diver
				flash[:danger] = "You can only edit your own profile"
				redirect_to root_path
			end
		end

end