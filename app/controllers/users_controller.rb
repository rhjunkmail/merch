class UsersController < ApplicationController
  before_action :find_user, except: [:new, :create]

  def show
  	@user = User.new
  end

  def new
  	@user = User.new
  end

  def create
  	if @user = User.new(user_params)
  		if @user.save
  			flash[:success] = "Welcome #{@user.email}!"
  			redirect_to user_path(@user)
  		else
  			flash[:error] = "Oops, that didn't work, try again"
			render :new
		end
	else
  	end
  end

  def edit
  end



  def update
  	if @user.update()
		flash[:success] = "Welcome #{@user.email}!"
		redirect_to user_path(@user) 
  	else
  			flash[:error] = "Oops, that didn't work, try again"
			render :edit
  	end
  end

  def destroy
  	@user.destroy
  	flash[:success] = "We're sorry to see you go #{@user.email} :(."

  	@user = nil
  	redirect_to root_path

end

private
	def user_params
		params.require(:user).permit(:email,:password, :password_confirmation)
	end

	def find_user
		  @user = User.find(params["id"])
	end
end