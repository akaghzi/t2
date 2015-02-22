# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Product.create(code: "tight-large-40l", specification: "tight, large size, length: 40 inches", price: 260)
Product.create(code: "tight-large-48l", specification: "tight, large size, length: 48 inches", price: 260)
Product.create(code: "tight-14-20", specification: "tight, 14-20 size", price: 110)
Product.create(code: "tight-20-36", specification: "tight, 20-36 size", price: 120)
Customer.create(owner: "om kar", store: "standard garments", city: "daharki", phone: "0333-759-4279")
Colour.create(name: "black")
Colour.create(name: "white")
Colour.create(name: "blue")
Colour.create(name: "red")
Colour.create(name: "maroon")
Colour.create(name: "sky blue")
Colour.create(name: "sea green")
Colour.create(name: "grey")
Colour.create(name: "brown")
Colour.create(name: "yellow")
Colour.create(name: "beige")
Colour.create(name: "navy blue")
Colour.create(name: "khaki")
Colour.create(name: "steel grey")