# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create(email: 'adminuser@example.com',
            password: 'adminadmin',
            password_confirmation: 'adminadmin',
            role: 1)
# Categiries
10.times do
  Category.create(title: Faker::Company.buzzword, description: Faker::Lorem.paragraph, remote_image_url: Faker::Avatar.image)
end

f = Category.first.id
t = Category.last.id
# Products
50.times do
  Product.create(title: Faker::Commerce.product_name, description: Faker::Lorem.paragraph, price: Faker::Commerce.price, remote_image_url: Faker::Avatar.image, category_id: rand(f..t))
end
