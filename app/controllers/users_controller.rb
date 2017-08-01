class UsersController < ApplicationController


	def new
	end

	def create
		@user = User.new(user_params)
		if @user.save
			session[:user_id] = @user.id
			redirect_to user_path(@user)
		else
			render :new
		end
	end

	def show
		@user = User.find(params[:id])
	end

	def edit

	end

	def update

	end

	def destroy
		@user = User.find(params[:id])
		@user.destroy
		session.clear
		redirect_to root_path
	end




private

	def user_params
		params.require(:user).permit(:username, :password, :password_confirmation, :address)
	end


end
