class LoginsController < ApplicationController 
	
	def new
		
	end

	def create
		diver = Diver.find_by(email: params[:email])
		if diver && diver.authenticate(params[:password])
			session[:diver_id] = diver.id
			flash[:success] = "Successfully Logged In!"
			redirect_to fires_path
		else
			flash.now[:danger] = "Your email or password does not match"
			render 'new'
		end
	end

	def destroy
		session[:diver_id] = nil
		flash[:success] = "Logged Out"
		redirect_to root_path
	end
end