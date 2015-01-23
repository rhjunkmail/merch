class SessionsController < ApplicationController

  def new
  end

  def create
  	# get password from params
    email = params[:session][:email]
    password = params[:session][:password]
  	# Get User from DB using email from params
  	@user = User.find_by(email: email)
    # Compare pw from params with pw from db
    if @user.present? and @user.authenticate(password)
    	# if pw==pw
    	# login
      # Unset any session data (in case of session hijacking)

      reset_session
      
      # Log in
      session[:user_id] = @user.id
      
      # tell them it worked
      flash[:success] = "Welcome back #{@user.email}."
      
      # send them home
      redirect_to root_path
  	else 
      # tell them it didn't work
      flash[:error] = "Oops, try again!"
      render :new
  	end

  end

  def destroy
    reset_session
    flash[:success] = "See you soon!"
    redirect_to root_path
  end

end
