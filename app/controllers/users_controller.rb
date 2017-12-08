class UsersController < ApplicationController
	def index
		@users = User.all
	end 
	def new 
		@user = User.new
	end 
	def create 
		@user = User.new(user_params)
		if @user.save
			login(@user)
			redirect_to user_path(@user)
		else
			flash[:error] = @user.errors.full_messages.join(' ')
			redirect_to new_user_path
		end 
	end 
	def show
		@user = User.find(session[:user_id])
		@recipes = @user.recipes
	end 
	private
	def user_params
		params.require(:user).permit(:first_name, :last_name, :email, :username, :password)
	end 
end
