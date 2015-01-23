class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :current_user, :current_user?
# Look for user using sesion data

def current_user
	# if there is session data, use it to lookup user
	if session[:user_id].present?
		User.find(session[:user_id])
	else
	end
end

def current_user?
	current_user.present?
end

def require_user
	unless current_user?
		flash[:error] = "You must be logged in to do that."
		redirect_to new_session_path and return # this is a security measure
	end
end

# define an action that checks for users and makes sure the user owns something

def require_owner
	#check for current user
	#use current_user to look for belongings

end
