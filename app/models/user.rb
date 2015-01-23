class User < ActiveRecord::Base
	has_secure_password

	has_many 	:products
	has_many	:orders

	validates 	:email, presence: true, uniqueness: true

end
