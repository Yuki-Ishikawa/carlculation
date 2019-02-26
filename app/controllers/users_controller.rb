class UsersController < ApplicationController
  	def show
    	@user = User.find(params[:id])
  		@cars = @user.cars.limit(3).reverse_order
  		@blogs = @user.blogs.limit(3).reverse_order
  		@notes = @user.notes.limit(3).reverse_order
  	end

  	def edit
  		@user = User.find(params[:id])
  	end

  	def update
    	@user = User.find(params[:id])
    	@user.update(user_params)
    	redirect_to user_path(@user.id)
  	end

  	def carlist
  		@user = User.find(params[:id])
  	end

  	def bloglist
  		@user = User.find(params[:id])
  	end

  	def notelist
  		@user = User.find(params[:id])
  	end

  	def index
  	end

  	private
  	def user_params
    	params.require(:user).permit(:user_name, :blog_title, :profile_image, :user_address, :sex, :job, :interest, :favorite, :self_introduction, :email)
  	end
end
