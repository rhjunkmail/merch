# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.create([{email: "batman@batcave.com"},{email: "robin@batcave.com"}]) 

Product.create	(
					[
						{
							name: 				"Swatch watch",
							price_in_pence: 	"5000",
							description: 		"It tells the time and everything!"
						},
						{
							name: 				"Beanie Hat",
							price_in_pence: 	"800",
							description: 		"It's a beanie hat which is totally rad and mustard yellow"	
						}
					]
				)