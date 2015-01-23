	class ProductsController < ApplicationController
	before_action	:require_user, only: [:new, :create]
	before_action 	:find_product, except: [:index,:new,:create]
	before_action	:require_owner, only: [:edit, :update, :destroy]

	def index
		# this is publicly available
		@products = Product.all
	end

	def show
		# this is publicly available
	end

	def new
		# only logged in users
		#require_user
		# if current_user?
			@product = current_user.products.new
		# else
		# 	flash[:error] = "You need to be logged in"
		# 	redirect_to new_session_path
		# end
	end

	def create
		#require_user
		# if current_user?
			#require_user
			@product = current_user.products.new(product_params)
			if @product.save
				flash[:success] = "A new product was added to the shop."
				redirect_to product_path(@product)
			else
				flash[:error] = "Oops, something went wrong, check the form and try again."
				render :new
			end
		# else
		# 	flash[:error] = "You need to be logged in"
		# 	redirect_to new_session_path

		# end
	end

	def edit
		# only logged in users and user is owner
		#require_owner(@product)
	end

	def update
		# only logged in users and user is owner
		#require_owner(@product)
		if @product.update(product_params)
			flash[:success] = "'#{@product.name}' was updated successfully."
			redirect_to product_path(@product)
		else
			flash[:error] = "Oops, something went wrong, check the form and try again."
			render :edit
		end
	end

	def destroy
				# only logged in users and user is owner
		#require_owner(@product)
		@product.destroy
			flash[:success] = "'#{@product.name}' was deleted from the shop."
		@product = nil
		redirect_to root_path

	end

private

	def product_params
		# Whitelisted form data
		params.require(:product).permit(:name,:description,:price_in_pence, :image)
	end

	def find_product
		# Query to read a record from the db
		@product = Product.find(params["id"])

	end


	def require_owner
	#check for current user
	#use current_user to look for belongings
		if current_user?
			# User current_user to look for belongings
			# Compare product parameter
			unless @product.user == current_user
				flash[:error] = "You can only manage products that you own"
				redirect_to root_path and return
			end
		else
			flash[:error] = "You have to be logged in to do that."
			redirect_to new_session_path and return
		end
	end 

end
