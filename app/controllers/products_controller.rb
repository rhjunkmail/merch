class ProductsController < ApplicationController
	
	before_action :find_product, except: [:index,:new,:create]

	def index
		@products = Product.all
	end

	def show

	end

	def new
		@product = Product.new
	end

	def create
		@product = Product.new(product_params)
		if @product.save
			flash[:success] = "A new product was added to the shop."
			redirect_to product_path(@product)
		else
			flash[:error] = "Oops, something went wrong, check the form and try again."
			render :new
		end

	end

	def edit

	end

	def update
		if @product.update(product_params)
			flash[:success] = "'#{@product.name}' was updated successfully."
			redirect_to product_path(@product)
		else
			flash[:error] = "Oops, something went wrong, check the form and try again."
			render :edit
		end
	end

	def destroy
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



end
