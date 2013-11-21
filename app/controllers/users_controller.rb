class UsersController < ApplicationController 
	def new
		@user = User.new
	end

	def create
		@user = User.new(user_params)
		@user.password_confirmation = @user.password
		if @user.save
			redirect_to root_url
		else
			render 'static_pages/home'
		end
	end

	private

	def user_params
		params.require(:user).permit(:email, :password)
	end
end