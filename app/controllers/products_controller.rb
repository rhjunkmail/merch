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
			redirect_to product_path(@product)
		else
			render new
		end

	end

	def edit
	end

	def update
	end

	def destroy
	end

private

	def product_params
		# Whitelisted form data
		params.require(:product).permit(:name,:description,:price_in_pence)
	end

	def find_product
		# Query to read a record from the db
		@product = Product.find(params["id"])

	end



end
