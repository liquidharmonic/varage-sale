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
  {name: 'eric', latitude: 50.70, longitude: 50},
  {name: 'alexander', latitude: 50.70, longitude: 50}
])

Item.create!([

  {
    category: Category.find_by_name('car'),
    seller: Seller.find_by_name('eric'),
    title: "r8 only $100,000!",
    description: "my amazing R8 for sale",
    price_in_cents: 10**5 * 100,
    status: 'available'
  },
  {
    category: Category.find_by_name('car'),
    seller: Seller.find_by_name('eric'),
    title: "m3 only $60,000!",
    description: "my amazing m3 for sale",
    price_in_cents: 6 * 10**4 * 100,
    status: 'sold'
  },
  {
    category: Category.find_by_name('clothing'),
    seller: Seller.find_by_name('eric'),
    title: "sexy shirt",
    description: "my sexy shirt for sale",
    price_in_cents: 10 * 100,
    status: 'banned'
  },
  {
    category: Category.find_by_name('other'),
    seller: Seller.find_by_name('alexander'),
    title: "n64 4 sale",
    description: "n64 4 sale",
    price_in_cents: 50 * 100,
    status: 'available'
  },
  {
    category: Category.find_by_name('car'),
    seller: Seller.find_by_name('alexander'),
    title: "a4 only $30,000!",
    description: "my amazing a4 for sale",
    price_in_cents: 3 * 10**4 * 100,
    status: 'expired'
  },
  {
    category: Category.find_by_name('other'),
    seller: Seller.find_by_name('alexander'),
    title: "dog 4 sale",
    description: "dog 4 sale",
    price_in_cents: 1000 * 100,
    status: 'pending'
  },

])
