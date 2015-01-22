class Product < ActiveRecord::Base

	validates :name, presence: true, uniqueness: true
	validates :description, presence: true, length: {minimum:25}
	validates :price_in_pence, numericality: true
	

end
