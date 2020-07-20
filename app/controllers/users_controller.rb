class UsersController < ApplicationController
	def index
    	@users = User.all
    end
	def show
		@user = User.find(params[:id])
	end
	def new
		@user = User.new
	end

	def create
	    @user = User.new(user_params)
	    # raise user_params.inspect
		if @user.save
			flash[:success] = "Welcome to the blog #{@user.username}"
			redirect_to articles_path
		else
			render 'new'
		end
	end
	def edit
    	@user = User.find(params[:id])
	end

	def update
	@user = User.find(params[:id])
		if @user.update(user_params)
			flash[:success] = "Your account was updated successfully"
			redirect_to articles_path
		else
			render 'edit'
		end
	end
	def show
		@user = User.find(params[:id])
	end

	private
		def user_params
			# raise params.inspect
			# raise params[:username].inspect
			# a=params[:article]
			# raise a.inspect
			params.require(:article).permit(:username, :email, :password)

		end
end