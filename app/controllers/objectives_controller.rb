class ObjectivesController < ApplicationController
	before_action :require_user, except: [:show]
	def new
		@objective = Objective.new
	end

	def create
		@objective = Objective.new(obj_params)
		if @objective.save
			flash[:success] = "Objective Added :D"
			redirect_to fires_path
		else
			render 'new'
		end
	end

	def show
		@objective = Objective.find(params[:id])
		@fires = @objective.fires.paginate(page: params[:page], per_page: 4)
	end


	private

		def obj_params
			params.require(:objective).permit(:name)
		end

end