class OrdersController < ApplicationController
	 before_action :require_user
	 before_action :find_product, except: [:index, :show]
	 def index
	  	#list of all previous orders for the current user
	 end

	 def show
	  	# Show the order as a receipt
	 	@product = Product.find(params["id"])
	 	@order = Order.find(params["id"])
	 end

	 def new
	 	# find_product
	 	@order = @product.orders.new
	 end

	 def create
	 	@order = @product.orders.new(order_params)
	 	if @order.save
	 		# create a charge via Stripe
	 		Stripe.api_key = "sk_test_zRxFYC7oDhf06EBkVve6eUNm"


	 		Stripe::Charge.create(
	 			:amount => @order.product.price_in_pence, 
	 			:currency => "gbp", 
	 			# :card => "tok_15O9aNAMMxpQq1PvjTSuuHSI",  
	 			:card => @order.stripe_token, # obtained with Stripe.js
	 			:description => "Charge for #{@order.product.name} purchased by #{@order.user.email}." 
	 			)
				
	  	#create a charge via Stripe
	  	#save a record of the purchase
	  	flash[:success] = "thanks for purchasing #{@product.name}, here is your receipt."
	  	#redirect to the receipt (show action)
	  	redirect_to user_order_path(current_user, @product)
	  	else
	  		flash[:error] = "Oops, something went wrong, check your details"
	  		render :new
	  	end
	  	redirect_to user_order_path(current_user)
	 end

private
def find_product
	 	@product = Product.find(params["product_id"])
end

def order_params
	params.require(:order).permit(:stripe_token, :delivery_address)
end
	


end
