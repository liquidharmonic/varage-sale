# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Category.create!([
  {name: 'car'},
  {name: 'clothing'},
  {name: 'other'},
])

Seller.create!([
  {name: 'eric', latitude: 50.70, longitude: 50}
])

Item.create!([

  {
    category: Category.find_by_name('car'),
    seller: Seller.find_by_name('eric'),
    title: "r8 only $100,000!",
    description: "my amazing R8 for sale",
    price_in_cents: 10**5 * 100,
    status: 'Available'
  },

])
